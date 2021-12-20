# [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)

## 题目

Given a binary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Note: A leaf is a node with no children.

Example:

Given binary tree [3,9,20,null,null,15,7],

```c
    3
   / \
  9  20
    /  \
   15   7
```

return its depth = 3.
 

## 题目大意

要求输出一棵树的最大高度。

## 解题思路

这一题递归遍历就可，遍历根节点的左孩子的高度和根节点右孩子的高度，取出两者的最大值再加一即为总高度。


- 一种是使用DFS的模版，时间复杂度高
- 一种类似于给一个整数n，求1+....+n的值。不就是递归公式：f(n) = f(n-1) + 1。 这里只不过每层有2种选择，而求和只有一种选择（想象成一颗最差的不平衡的二叉树）

