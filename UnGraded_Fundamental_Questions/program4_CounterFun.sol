// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Create a Solidity contract that maintains a state variable counter initialized to 50. 
// Implement a function that increments this counter by a provided value and another function 
// to retrieve the current value of the counter.

contract CounterFun {
    uint256 public counter;
    constructor() {
        counter = 50;
    }
    function increment(uint256 value) public {
        counter += value;
    }
    function get() public view returns(uint256) {
        return counter;
    }
}
```
