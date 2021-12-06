# [15. 3Sum](https://leetcode.com/problems/3sum/)

## 题目

Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

```c
Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]
```

## 题目大意

给定一个数组，要求在这个数组中找出 3 个数之和为 0 的所有组合。

## 解题思路

Sort the array, and traverse it, increment left or decrease right predicated on their sum is greater or not than the target

1:此题使用双指针，有点类似快排small，equal，large移动的感觉
PS:先排序，前后指针碰撞，然后跳过重复的元素

2:选定一个数，另外2数的和就是选定数的负数。为了避免重复排序后如果下一个元素跟之前的元素相同则跳过选中的这个元素
3.主要是如何解决重复的问题，这就需要去排序，排序后，相同的2个元素一定是相邻的，这时候指针跳过即可。




