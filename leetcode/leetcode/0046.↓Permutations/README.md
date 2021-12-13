# [46. Permutations](https://leetcode.com/problems/permutations/)


## 题目

Given a collection of **distinct** integers, return all possible permutations.

**Example:**


    Input: [1,2,3]
    Output:
    [
      [1,2,3],
      [1,3,2],
      [2,1,3],
      [2,3,1],
      [3,1,2],
      [3,2,1]
    ]


## 题目大意

给定一个没有重复数字的序列，返回其所有可能的全排列。


## 解题思路

- 求出一个数组的排列组合中的所有排列，用 DFS 深搜即可。
- 和77题组合类似，但此题顺序不同为不同的一组解。关键在于取了一个数字，下次怎么取剩下的数字。自己思考的是（1）移除它（2）2次for循环 1～index ，index～count。但霜神优秀的答案是用一个bool数组来存储它的状态

[回溯算法入门级详解](https://leetcode-cn.com/problems/permutations/solution/hui-su-suan-fa-python-dai-ma-java-dai-ma-by-liweiw/)
