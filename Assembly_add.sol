// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

/*
* @title: 
* @author: Anthony (fps) https://github.com/fps8k .
* @dev: 
*/

contract Add
{
    // Variable to hold the value of the sum returned by the assemblyAdd function.
    uint256 public sum;



    /*
    * @dev
    *
    * Private function uses assembly to add two numbers.
    * This function is called by another function.
    *
    *
    * @param
    *
    * uint256 a -> First number.
    * uint256 b -> Second number.
    *
    *
    * @return
    * 
    * uint256 _sum, this will be explicitly returned and can be used by the solidity code.
    */
    function assemblyAdd(uint256 a, uint256 b) private pure returns(uint256 _sum)
    {
        // Assembly block for addition
        assembly
        {
            // Assign first number in the function to a variable.
            let _a := a
            // Assign second number in the function to a variable.
            let _b := b
            // Perform sum and return the variable.
            _sum := add(a,b)
        }
    }



    /*
    * @dev
    *
    * Function performAddition 
    *
    *
    * @param
    *
    * uint256 a -> First number.
    * uint256 b -> Second number.
    *
    *
    * @return
    * 
    * uint256
    */
    function performAddition(uint256 a, uint256 b) public
    {
        sum = assemblyAdd(a, b);
    }
}