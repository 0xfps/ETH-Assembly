// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
* @title: Array Sorter Library.
* @author: Anthony (fps) https://github.com/fps8k .
* @dev:
* This library takes an array [unordered, mostly] as an argument.
* It sorts the array in ascending or descending order, depending on the user's choice.
* Then returns the new array created from the old array.
*/

contract ArraySorter
{
    // Test arrays.
    uint256[] public testArray = [9, 3, 11, 1, 1, 0, 3, 5];
    // uint256[] public testArray = [5, 6, 5];
    // uint256[] public testArray = [5, 6, 3];
    // uint256[] public testArray = [5, 3];


    /*
    * @dev
    * Function sortAsc sort takes in an array of numbers and arranges them from lowest to highest.
    *
    * @param:
    * uint256[] storage _array -> An array placed to memory.
    */

    function sortAsc(uint256[] storage _array) internal returns(uint256[] memory)
    {
        // Ensure the length of the array is > 0.
        require (_array.length > 0, "Cannot sort 0 length array!");

        // If array length == 1 it should return the array and stop executing.
        if (_array.length > 1)
            // Return array.
            return _sortAsc(_array);

        // If the array length is == 1.
        return _array;
    }



    /*
    * @dev
    * This handles the actual sorting.
    */
    function _sortAsc(uint256[] storage _array) private returns(uint256[] memory)
    {
        // In this function block, it is assumed that the length of the array is >= 2.

        /*
        * @notice
        * In this function the following procedures will be followed:
        * 
        */
        
        
        uint256 len = _array.length;
        // New array to be returned.
        uint256[] memory newArray = new uint256[](len);
        // Index for the new array.
        uint256 index;
        
        while (len > 0)
        {
            // This holds the current minimum value in the array.
            uint256 min = _array[0];
            // Counter that resets on each loop to hold the index of the current min value.
            uint256 counter = 0;   
            
            // If the length of the array is now one, it should simply copy the only element to the newArray.
            if (len == 1)
            {
                // Set the last index of the newArray to the only element in the current lone array.
                newArray[index] = min;
            }
            else
            {
                // This should compare the current min value to all the elements in the array to ascertain the minimum value.
                for (uint j = 1; j < len; j++)
                {
                    // If the current minimum value is greater than any element in the array, then a new minimum value is found.
                    if (min >= _array[j])
                    {
                        // Reassign the minimum value.
                        min = _array[j];
                        // Grab the index of the minimum value.
                        counter = j;
                    }
                }

                // Append the minimum value to the current index of the newArray.
                newArray[index] = min;
                // Replace the element at that index in the array that is being sorted with the last element.
                // This will remove that element, because it has been recorded.
                // This is done so that the length of the array will reduce.
                _array[counter] = _array[len - 1];
                // Pop the array that is being sorted.
                // Because the last element was used to replace the current minimum value element, nothing is lost.
                _array.pop();
            }

            // Increment the index.
            index++;
            // Reduce the length because the array length has reduced by one.
            len--;
        }

        // Return the array formed.
        return newArray;
    }



    /*
    * @dev
    * Function sortDesc sort takes in an array of numbers and arranges them from higheswest to lowest.
    *
    * @param:
    * uint256[] storage _array.
    */

    function sortDesc(uint256[] storage _array) internal returns(uint256[] memory)
    {
        // Ensure the length of the array is > 0.
        require (_array.length > 0, "Cannot sort 0 length array!");

        // If array length == 1 it should return the array and stop executing.
        if (_array.length > 1)
            // Return array.
            return _sortDesc(_array);

        // If the array length is == 1.
        return _array;
    }



    /*
    * @dev
    * This handles the actual sorting.
    */
    function _sortDesc(uint256[] storage _array) private returns(uint256[] memory)
    {
        // In this function block, it is assumed that the length of the array is >= 2.

        /*
        * @notice
        * In this function the following procedures will be followed:
        * 
        */
        
        
        uint256 len = _array.length;
        // New array to be returned.
        uint256[] memory newArray = new uint256[](len);
        // Index for the new array.
        uint256 index;
        
        while (len > 0)
        {
            // This holds the current maximum value in the array.
            uint256 max = _array[0];
            // Counter that resets on each loop to hold the index of the current min value.
            uint256 counter = 0;   
            
            // If the length of the array is now one, it should simply copy the only element to the newArray.
            if (len == 1)
            {
                // Set the last index of the newArray to the only element in the current lone array.
                newArray[index] = max;
            }
            else
            {
                // This should compare the current min value to all the elements in the array to ascertain the maximum value.
                for (uint j = 1; j < len; j++)
                {
                    // If the current maximum value is greater than any element in the array, then a new maximum value is found.
                    if (max <= _array[j])
                    {
                        // Reassign the maximum value.
                        max = _array[j];
                        // Grab the index of the maximum value.
                        counter = j;
                    }
                }

                // Append the maximum value to the current index of the newArray.
                newArray[index] = max;
                // Replace the element at that index in the array that is being sorted with the last element.
                // This will remove that element, because it has been recorded.
                // This is done so that the length of the array will reduce.
                _array[counter] = _array[len - 1];
                // Pop the array that is being sorted.
                // Because the last element was used to replace the current maximum value element, nothing is lost.
                _array.pop();
            }

            // Increment the index.
            index++;
            // Reduce the length because the array length has reduced by one.
            len--;
        }

        // Return the array formed.
        return newArray;
    }


    // Test.
    function SORT() public
    {
        testArray = sortDesc(testArray);
    }
}