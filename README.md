##array-delete.sol
    pragma solidity ^0.5.1;

    contract ArrayDelete {
    uint[] numbers;

    function main() public returns (uint[] memory) {
        numbers.push(100);
        numbers.push(200);
        numbers.push(300);
        numbers.push(400);
        numbers.push(500);

        delete numbers[2];

        // 100, 200, 0, 400, 500
        return numbers;
    }
    }

## array-of-strings.sol
    pragma solidity ^0.5.1;
    contract MyContract {
    string[] strings;

    constructor() public{
        strings.push("hi");
        strings.push("bye");
    }

    function bar() public view returns(string memory) {
        return strings[1];
    }
    }
##mapping-delete.sol
    pragma solidity ^0.5.1;

    contract MyContract {
    struct Data {
        uint a;
        uint b;
    }
    mapping (uint => Data) public items;
    function testMyContract() public{
        items[0] = Data(1,2);
        items[1] = Data(3,4);
        items[2] = Data(5,6);
        delete items[1];
    }
    }
##factory.sol
    pragma solidity ^0.5.1;

    contract A {
    uint[] public amounts;
    function init(uint[] memory _amounts)public {
        amounts = _amounts;
    }
    }

    contract Factory {
    struct AData {
        uint[] amounts;
    }
    mapping (address => AData) listOfData;

    function set(uint[] memory _amounts) public{
        listOfData[msg.sender] = AData(_amounts);
    }

    function make() public payable returns(address) {
        A a = new A();
        a.init(listOfData[msg.sender].amounts);
        return address(a);
    }
    }
    
##basic-token-annotated.sol
    // declare which version of Solidity we are using
    // different versions of Solidity have different
    pragma solidity ^0.5.1;

    // define a smart contract called "BasicToken"
    contract BasicToken {

    // examples of simple variables
    // string myName;
    // bool isApproved;
    // uint daysRemaining;

    // an array is a list of individuals values, e.g. list of numbers, list of names
    // uint256[] numbers;

    // a mapping is a list of pairs
    mapping(address => uint256) balances; // a mapping of all user's balances
    // 0xa5c => 10 Ether
    // 0x91b => 5 Ether
    // 0xcdd => 1.25 Ether

    // another mapping example
    // mapping(address => bool) signatures; // a mapping of signatures
    // 0xa2d => true (approved)
    // 0xb24 => true (approved)
    // 0x515 => false (not approved)

    // address myAddress = 0x1235647381947839275893275893; // ethereum address
    // uint256 count = 10; // unsigned (non-negative) integer, 256-bytes in size

    /**
    * @dev transfer token for a specified address
    * @param recipient The address to transfer to.
    * @param value The amount to be transferred.
    */
    // define a function called "transfer"
    // inputs? (parameters) an address called "recipient" and a uint256 called "value"
    function transfer(address recipient, uint256 value) public {
        // msg.sender is a predefined variable that specifies the address of the
        // person sending this transaction
        // address msg.sender = 0x5ba...;

        // balances[msg.sender] -> set the balance of the sender
        // set the balance of the sender to their current balance minus value
        // withdrawing tokens from the sender's account
        balances[msg.sender] -= value;

        // balances[recipient] -> set the balance of the receiver (recipient)
        // set the balance of the receiver to their current balance plus value
        // depositing tokens into the receiver's account
        balances[recipient] += value;
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param account The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    // define function called "balanceOf"
    // inputs? (parameters) the address of the owner (account)
    // ontputs? (returns) the balance (number)
    function balanceOf(address account) public view returns (uint256) {

        // balances[account] -> return the balance of the owner
        return balances[account];
    }
    }
    
## basic-token-unannotated.sol
    pragma solidity ^0.5.1;

    contract BasicToken {

    mapping(address => uint256) balances;

    function transfer(address recipient, uint256 value) public {
        balances[msg.sender] -= value;
        balances[recipient] += value;
    }

    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }
    }