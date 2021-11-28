# [24. Swap Nodes in Pairs](https://leetcode.com/problems/swap-nodes-in-pairs/description/)

## 题目

Given a linked list, swap every two adjacent nodes and return its head.

You may not modify the values in the list's nodes, only nodes itself may be changed.



Example:

```c
Given 1->2->3->4, you should return the list as 2->1->4->3.
```

## 题目大意

两两相邻的元素，翻转链表

## 解题思路

按照题意做即可。类似第21题合并有序链表的递归画图思路。

递归：
时间复杂度：O(n)，其中 n 是链表的节点数量。需要对每个节点进行更新指针的操作。
空间复杂度：O(n)，其中 n 是链表的节点数量。空间复杂度主要取决于递归调用的栈空间。

迭代：（空间复杂度更好）
时间复杂度：O(n)，其中 n 是链表的节点数量。需要对每个节点进行更新指针的操作。
空间复杂度：O(1)。
