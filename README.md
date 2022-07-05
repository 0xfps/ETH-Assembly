# ETH-Assembly
Solidity, but mostly Assembly.

## Assembly.sol
- A solidity contract that uses the basics of assembly to calculate math.

## MathLib.sol:
- This library has two main functions that take an array [unordered, mostly] as an argument.
- It sorts the array in ascending or descending order, depending on the user's choice.
- Then returns the new array created from the old array.
 
- [GAS USAGE]
- This gas test was done with a constant unordered array of 8 elements.
- Ascending: ~ 152696 gas.
- Descending: ~ 125730 gas.
