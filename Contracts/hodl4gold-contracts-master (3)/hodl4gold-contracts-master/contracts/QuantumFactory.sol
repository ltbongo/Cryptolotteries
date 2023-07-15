// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./QuantumStaking.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IQuantumStaking {
    function initialize(
        IERC20 _stakingToken,
        IERC20 _earnedToken,
        address _dividendToken,
        uint256 _rewardPerBlock,
        uint256 _depositFee,
        uint256 _withdrawFee,
        address _uniRouter,
        address[] memory _earnedToStakedPath,
        address[] memory _reflectionToStakedPath,
        bool _hasDividend
    ) external;

    function transferOwnership(address newOwner) external;

    function owner() external returns (address);
}

contract QuantumFactory is Ownable {
    mapping(address => mapping(uint256 => address)) public registry;

    mapping(address => uint256) public createdContractsByAddress;

    mapping(address => string) public cardURL;

    event StakingContractCreated(address Creator, address StakingContract);

    address[] public createdContracts;

    uint256 public totalContractsCreated;

    uint256 public fee = 0.1 ether;

    function createStakingContract(
        IERC20 _stakingToken,
        IERC20 _earnedToken,
        address _dividendToken,
        uint256 _rewardPerBlock,
        uint256 _depositFee,
        uint256 _withdrawFee,
        address _uniRouter,
        address[] memory _earnedToStakedPath,
        address[] memory _reflectionToStakedPath,
        bool _hasDividend,
        string memory _cardURL
    ) external payable returns (address stakingContract) {
        require(msg.value == fee, "Wrong Amount");
        bytes memory bytecode = type(QuantumStaking).creationCode;

        bytes32 salt = keccak256(
            abi.encodePacked(
                msg.sender,
                address(_stakingToken),
                address(_earnedToken),
                createdContractsByAddress[msg.sender]
            )
        );

        assembly {
            stakingContract := create2(
                0,
                add(bytecode, 32),
                mload(bytecode),
                salt
            )
        }

        IQuantumStaking(stakingContract).initialize(
            _stakingToken,
            _earnedToken,
            _dividendToken,
            _rewardPerBlock,
            _depositFee,
            _withdrawFee,
            _uniRouter,
            _earnedToStakedPath,
            _reflectionToStakedPath,
            _hasDividend
        );

        IQuantumStaking(stakingContract).transferOwnership(msg.sender);

        registry[msg.sender][
            createdContractsByAddress[msg.sender]
        ] = stakingContract;

        createdContractsByAddress[msg.sender]++;

        createdContracts.push(stakingContract);

        //registry[msg.sender].push(stakingContract);

        totalContractsCreated++;

        cardURL[stakingContract] = _cardURL;

        emit StakingContractCreated(msg.sender, stakingContract);

        return stakingContract;
    }

    function setCardURL(address stakingContract, string memory url) public {
        require(
            IQuantumStaking(stakingContract).owner() == msg.sender,
            "Not the owner of this staking contract"
        );

        cardURL[stakingContract] = url;
    }

    function setFee(uint256 _fee) public onlyOwner {
        fee = _fee;
    }

    function withdrawFees() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function getCreatedContracts() public view returns (address[] memory) {
        return createdContracts;
    }
}
