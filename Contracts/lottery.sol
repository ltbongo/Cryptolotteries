/**
 *Submitted for verification at BscScan.com on 2022-04-05
*/

// SPDX-License-Identifier: agpl-3.0
pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);
     function increaseAllowance(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

pragma solidity ^0.8.0;

contract Lottery{
    using SafeMath for uint256;
  
    address public owner;
    uint256 public currentId;
    uint256 public ticketfee;
    uint256 public duration;
    uint256 public currentUserId;
    uint256 public ticketchargefee;
    enum Status{ACTIVE,FINISHED}
    IERC20 public busd;

     struct Event{
        uint256 eventid;
        uint256 starttime;
        uint256 endtime;
        uint256[] userindex;
        
        Status status;
        uint256 winnerno;
    }

    struct User{
        uint256 amount;
        uint256 randomno;
        address user;
        uint256 index;
    }

   mapping(uint256 => User[]) public eventUserList;

    Event[] events;

    constructor(IERC20 _busd) {
        busd=_busd;
        owner=msg.sender;
        ticketfee=1 ether;
        duration=7;
        ticketchargefee=1;
        
    }
    modifier onlyOwner(){
        require(msg.sender == owner,"You are not the owner");
        _;
    }
   
    mapping(uint256 => mapping(uint256 => uint256)) public checkDuplicate;
    

    function changeticketFee(uint256 _ticketfee) public onlyOwner{
        ticketfee=_ticketfee;
    }
    function changeDuration(uint256 _duration) public onlyOwner{
        duration=_duration;
    }

    function changeOwner(address _address) public onlyOwner{
        owner=_address;
    }

    function changeticketChargeFee(uint256 _ticketchargefee) public onlyOwner{
        ticketchargefee=_ticketchargefee;
    }

    function createEvent() public{
        	Event memory lotevent= Event({
                eventid:currentId,
                starttime:block.timestamp,
                endtime:block.timestamp + (duration * 86400),
                status:Status.ACTIVE,
                userindex:new uint256[](0),
                winnerno:0
            });
             events.push(lotevent);
           
    }
    
    function joinEvent(uint256[] memory randomnumber) public{
            uint256 randomnumberlength=randomnumber.length;
            uint256 totalfee=randomnumberlength * ticketfee;
            uint256 ownerfee=totalfee.mul(ticketchargefee).div(100);
            busd.transferFrom(msg.sender,owner,ownerfee);
            busd.transferFrom(msg.sender,address(this),totalfee.sub(ownerfee));

            for(uint256 i=0;i < randomnumber.length;i++ ){
            uint256 rnumber=randomnumber[i];    
            require(checkDuplicate[currentId][rnumber] !=1,'Try another number');
            checkDuplicate[currentId][rnumber]=1;
            Event storage lottevent=events[currentId];
            eventUserList[currentId].push(User(0,rnumber,msg.sender,currentUserId));
            lottevent.userindex.push(currentUserId);
            currentUserId+=1;
            }
    }
    
    function distribute(uint256[] memory category1,uint256[] memory category2,uint256[] memory category3,uint256[] memory category4,uint256[] memory category5,uint256 winnerno,uint256[]  memory value) public{
           
            uint256 category1percent=5;
            uint256 category2percent=10;
            uint256 category3percent=15;
            uint256 category4percent=30;
            uint256 category5percent=40;
            
            for(uint256 i=0;i < category1.length;i++){
                uint256 userindex=category1[i];
                User storage _user=eventUserList[currentId][userindex];
                uint256 length=category1.length;
                uint256 percent= category1percent.mul(value[0]).div(length);
                uint256 amount=getAmount(percent).div(value[0]);
                address winner=_user.user;
                _user.amount=amount;
                busd.increaseAllowance(address(this),amount);
                busd.transferFrom(address(this),winner,amount);
            }
            for(uint256 i=0;i < category2.length;i++){
                 uint256 userindex=category2[i];
                User storage _user=eventUserList[currentId][userindex];
                uint256 percent= category2percent.mul(value[1]).div(category2.length);
                uint256 amount=getAmount(percent).div(value[1]);
                address winner=_user.user;
                _user.amount=amount;
                busd.increaseAllowance(address(this),amount);
                busd.transferFrom(address(this),winner,amount);
                
            }
             for(uint256 i=0;i < category3.length;i++){
                 uint256 userindex=category3[i];
                User storage _user=eventUserList[currentId][userindex];
                uint256 percent= category3percent.mul(value[2]).div(category3.length);
                uint256 amount=getAmount(percent).div(value[2]);
                address winner=_user.user;
                _user.amount=amount;
                busd.increaseAllowance(address(this),amount);
                busd.transferFrom(address(this),winner,amount);
            }
             for(uint256 i=0;i < category4.length;i++){
                 uint256 userindex=category4[i];
                User storage _user=eventUserList[currentId][userindex];
                uint256 percent= category4percent.mul(value[3]).div(category4.length);
                uint256 amount=getAmount(percent).div(value[3]);
                address winner=_user.user;
                _user.amount=amount;
                busd.increaseAllowance(address(this),amount);
                busd.transferFrom(address(this),winner,amount);
            }
             for(uint256 i=0;i < category5.length;i++){
                 uint256 userindex=category5[i];
                User storage _user=eventUserList[currentId][userindex];
                uint256 percent= category5percent.mul(value[4]).div(category5.length);
                uint256 amount=getAmount(percent).div(value[4]);
                address winner=_user.user;
                _user.amount=amount;
                busd.increaseAllowance(address(this),amount);
                busd.transferFrom(address(this),winner,amount);
            }
             Event storage lotevent=events[currentId];
             lotevent.status=Status.FINISHED;
             lotevent.winnerno=winnerno;
             currentUserId=0;
             currentId+=1;
             createEvent();
          
    }
   

    function getCurrentEvent() public view returns(uint256){
            return currentId;
    }
    
   
    
    function getCurrentEventInfo()public view returns(uint256 eventid,uint256 starttime,uint256 endtime,uint256[] memory userIndex){
          Event storage lotevent=events[currentId];
       
             eventid= lotevent.eventid;
             starttime=lotevent.starttime;
             endtime= lotevent.endtime;
             userIndex=lotevent.userindex;
    }

    function getAmount(uint256 percent)public view returns(uint256){
        return (totalBalance().mul(percent).div(100));
    }

    function transfer(uint256 amount) public onlyOwner{
        busd.transferFrom(msg.sender,address(this),amount);
    }

    function withdrawbusd(uint256 amount) public onlyOwner{
        busd.increaseAllowance(address(this),amount);
        busd.transferFrom(address(this),msg.sender,amount);
    }
    function totalBalance() public view returns(uint256){
        return busd.balanceOf(address(this));
    }

    function getEventUserList(uint _id) public view returns(User[] memory){
        return eventUserList[_id];
    }
}