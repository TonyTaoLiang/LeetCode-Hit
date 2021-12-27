# [543. Diameter of Binary Tree](https://leetcode-cn.com/problems/diameter-of-binary-tree/)


## 题目

Given the root of a binary tree, return the length of the diameter of the tree.

The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

The length of a path between two nodes is represented by the number of edges between them.


**Example 1:**

```
    1
  2   3
4  5 

Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].

```

**Example 2:**

```
Input: root = [1,2]
Output: 1

```

**Note:**

- The number of nodes in the tree is in the range [1, 104].
- -100 <= Node.val <= 100

## 题目大意

给定一棵二叉树，你需要计算它的直径长度。一棵二叉树的直径长度是任意两个结点路径长度中的最大值。这条路径可能穿过也可能不穿过根结点


## 解题思路

- 计算直径：每一条二叉树的「直径」长度就是一个节点的左右子树的最大深度之和
 - 跟104求二叉树最大深度；124二叉树最大路径和有点类似，都是跟左右子树相关，考虑后序遍历。遇到子树问题，首先想到的是给函数设置返回值，然后在后序位置做文章。
