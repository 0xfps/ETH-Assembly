// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
* @title: Array Sorter Library.
* @author: Anthony (fps) https://github.com/fps8k .
* @dev:
* This library takes an array [unordered, mostly] as an argument.
* It sorts the array in ascending or descending order, depending on the user's choice.
* Then returns the new array created from the old array.
*
* [GAS USAGE]
* This gas test was done with a constant unordered array of 8 elements.
* Ascending: ~ 152696 gas.
* Descending: ~ 125730 gas.
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
    * Function sortAsc (Sort Ascending).
    * It takes in an array of numbers, runs some checks and passes it as an argumant to the function _sortAsc().
    * The called function [_sortAsc()] arranges the array elements from lowest to highest.
    * This returns the ordered array returned by the _sortAsc() function.
    * This uses ~ 152696 gas.
    *
    * @param:
    * uint256[] _array -> Array to be sorted.
    *
    * @return
    * uint256[] -> Array (memory) to be assigned to the desired storage array variable.
    */
    function sortAsc(uint256[] storage _array) internal returns(uint256[] memory)
    {
        // Makes sure that the length of the array is > 0.
        require (_array.length > 0, "0 Length Array!");

        // If array length > 1, it calls the sorting function.
        if (_array.length > 1)
            // This function sorts the array and returns the ordered array.
            return _sortAsc(_array);

        // If array length == 1, it should return the array and stop executing [There is nothing to sort].
        return _array;
    }



    /*
    * @dev
    * [Ref line 31] :: Arranges the function from lowest to highest.
    *
    * @param:
    * uint256[] _array -> Array to be sorted, passed from sortAsc().
    *
    * @return
    * uint256[] -> ordered arrray.
    */
    function _sortAsc(uint256[] storage _array) private returns(uint256[] memory)
    {
        // In this function block, the length of the array is >= 2 [ref line 47].
        /*
        * @notice
        * The first element of the array is taken and assigned to the min variable.
        * The min variable is compared with each subsequent individual element in the array.
        * If min is >= the element, the element becomes the new min variable value and the index of the element is recorded.
        * At the end of the comparison, the min variable is recorded, and replaced by the last element, and the array is popped [_array.pop()].
        * The current min value is ppushed to a new array which has already been created to memory.
        * The length of the new array is such to ensure that:
        *
        * uint256[] memory new_array = new uint256[](len);
        *
        * Where len is the length of the array we want to sort.
        * At the end of the loop, (when the length of the array to be sorted is == 1), the last element is pushed to the last index of the new array.
        * The new array is returned.
        */

        // Length of the array to be sorted.
        uint256 len = _array.length;
        // New array to be returned.
        uint256[] memory new_array = new uint256[](len);
        // Index for the new array.
        uint256 index;
        // Loop until the length of the array to be sorted becomes 1.
        while (len > 0)
        {
            // This holds the current minimum value in the array; whenever the array is popped and the loop is to repeat.
            uint256 min = _array[0];
            // Counter that resets on each loop to hold the index of the current min value.
            uint256 counter = 0;   
            
            // If the length of the array is now one, it should simply copy the only element to the new array.
            if (len == 1)
            {
                // Set the last index of the new array to the only element in the current lone array.
                new_array[index] = min;
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
                        // Grab the index of the current minimum value.
                        counter = j;
                    }
                }

                // Append the minimum value to the current index of the new array.
                new_array[index] = min;
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

        // Return the new array formed.
        return new_array;
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
        uint256[] memory new_array = new uint256[](len);
        // Index for the new array.
        uint256 index;
        
        while (len > 0)
        {
            // This holds the current maximum value in the array.
            uint256 max = _array[0];
            // Counter that resets on each loop to hold the index of the current min value.
            uint256 counter = 0;   
            
            // If the length of the array is now one, it should simply copy the only element to the new_array.
            if (len == 1)
            {
                // Set the last index of the new_array to the only element in the current lone array.
                new_array[index] = max;
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

                // Append the maximum value to the current index of the new_array.
                new_array[index] = max;
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
        return new_array;
    }


    // Test.
    function SORT() public
    {
        testArray = sortAsc(testArray);
    }
}