// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./MathLib.sol";

/*
* @title: Array Sorter Library.
* @author: Anthony (fps) https://github.com/0xfps.
* @dev: Contract to sort arrays in ascending or descending order.
*/
contract F {
    using ArraySorter for uint256[];

    uint[] public a = [8, 7, 2, 2, 0, 8, 9];
    uint[] public j;

    function sortArrInDesc() public {
        j = a.sortDesc();
    }
    
    function sortArrInAsc() public {
        j = a.sortAsc();
    }
}
