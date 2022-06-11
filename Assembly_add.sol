// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

/*
* @title: 
* @author: Anthony (fps) https://github.com/fps8k .
* @dev: 
*/

contract Add
{
    // ================= A D D I T I O N ==========================

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
    function performAddition(uint256 a, uint256 b) public pure returns(uint256)
    {
        return assemblyAdd(a, b);
    }

    // ================= A D D I T I O N ==========================



    // ================ S U B T R A C T I O N ======================

    /*
    * @dev
    *
    * Private function uses assembly to find the difference between two numbers.
    * Condition is that the second will be less than the first.
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
    * uint256 _diff, this will be explicitly returned and can be used by the solidity code.
    */
    function assemblySub(uint256 a, uint256 b) private pure returns(uint256 _diff)
    {
        // Assembly block for addition
        assembly
        {
            // Assign first number in the function to a variable.
            let _a := a
            // Assign second number in the function to a variable.
            let _b := b
            // If the first number _a is greater than the second number _b
            if gt(_a, _b)
            {
                // Perform the difference and return the variable.
                _diff := sub(a,b)
            }
        }
    }



    /*
    * @dev
    *
    * Function performSubtraction
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
    function performSubtraction(uint256 a, uint256 b) public pure returns(uint256)
    {
        return assemblySub(a, b);
    }

    // ================ S U B T R A C T I O N ======================



    // ============ P R O D U C T ===========

    /*
    * @dev
    *
    * Private function uses assembly to multiply two numbers.
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
    * uint256 _prod, this will be explicitly returned and can be used by the solidity code.
    */
    function assemblyProd(uint256 a, uint256 b) public pure returns(uint256 _prod)
    {
        // Assembly block for addition
        assembly
        {
            // Assign first number in the function to a variable.
            let _a := a
            // Assign second number in the function to a variable.
            let _b := b
            // Perform sum and return the variable.
            _prod := mul(a,b)
        }
    }

    // ============ P R O D U C T ===========



    // ====== F U N C T I O N S   A N D   L O O P S ==============

    /*
    * @dev
    *
    * Private function uses assembly to add all the numbers within a range numbers.
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
    function assemblyFunc(uint256 a, uint256 b) public pure returns(uint256 _cumul)
    {
        // Assembly block for addition
        assembly
        {
            // Assign first value to first number.
            let _a := a
            // Assign second value to second number.
            let _b := b

            // Function addLoop adds the numbers starting from the first number all to the second, and return the total.
            function addLoop(start, end) -> total
            {
                // Initialize sum to 0.
                let sum := 0
                // Loop from the first value to the last value.
                for{let i := start} lt(i, add(end, 1)) {i := add(i, 1)}
                {
                    // Add the current value to the sum.
                    sum := add(sum, i)
                }
                // Return the total.
                total := sum
            }
            // Then return the _cumul for solidity.
            _cumul := addLoop(_a, _b)
        }
    }

    // ====== F U N C T I O N S   A N D   L O O P S ==============
}