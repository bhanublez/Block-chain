// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract A {
    uint256 public x = 10;

    uint256 private y = 20;

    uint256 internal z = 30;

    function fun1() private pure returns (string memory) {
        return "Private Function";
    }

    function fun2() internal pure returns (string memory) {
        return "Internal Function";
    }

    function fun3() external pure returns (string memory) {
        return "External Function";
    }

    function fun4() public pure returns (string memory) {
        return "Public Function";
    }

    function check() public pure returns (string memory) {
        return fun4();
    }
}

contract B is
    A // B - Dertived Contract, A - Parent Contract
{
    uint256 public q = z;
}

contract C {
    // Another Contract

    A obj = new A();

    string public va = obj.fun3();
}
