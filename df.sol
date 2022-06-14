// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./MathLib.sol";

/*
* @title: Array Sorter Library.
* @author: Anthony (fps) https://github.com/fps8k.
* @dev:
* 
*/

contract f
{
    using ArraySorter for uint256[];

    uint[] public a = [8, 7, 2, 2, 0, 8, 9];
    uint[] public j;

    function m() public
    {
        j = a.sortDesc();
    }
}