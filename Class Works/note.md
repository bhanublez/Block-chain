Storage:

Refers to the persistent storage area that holds the contract's state variables. Data stored in storage is written to the Ethereum blockchain, meaning it persists between function calls and transactions.
Modifying storage data changes the state on the blockchain, which costs gas.
In the context of the crowdfunding contract, storage is used for the Campaign struct instances because these changes (like updating totalFunds) need to be persistent and reflect in the contract's state.
Memory:

Refers to a temporary place to store data during function execution. memory data is wiped clean at the end of function execution and does not get written to the blockchain.
It's cheaper in terms of gas to use memory since it doesn't involve blockchain state changes.
You would use memory for short-lived variables that only need to exist during the execution of a function.