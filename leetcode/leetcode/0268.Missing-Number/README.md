# [268. Missing Number](https://leetcode.com/problems/missing-number/)


## 题目

Given an array containing n distinct numbers taken from `0, 1, 2, ..., n`, find the one that is missing from the array.

**Example 1:**

    Input: [3,0,1]
    Output: 2

**Example 2:**

    Input: [9,6,4,2,3,5,7,0,1]
    Output: 8

**Note**:Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?


## 题目大意

给定一个包含 0, 1, 2, ..., n 中 n 个数的序列，找出 0 .. n 中没有出现在序列中的那个数。算法应该具有线性时间复杂度。你能否仅使用额外常数空间来实现?



## 解题思路


- 最开始的想法是高斯求和，减去数组的元素和即是最终结果。
- 这题也可用异或的方法：如果在数组尾部开始添加0...n个元素，那么总共2n+1个元素，除了那个missingNum，其他所有元素都出现了2次，岂不是变成了137题求只出现一次的元素。
