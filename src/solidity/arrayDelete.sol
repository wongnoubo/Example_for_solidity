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