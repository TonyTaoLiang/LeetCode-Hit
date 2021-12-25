# [108. Convert Sorted Array to Binary Search Tree](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/)


## 题目

Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of *every* node never differ by more than 1.

**Example:**

    Given the sorted array: [-10,-3,0,5,9],
    
    One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
    
          0
         / \
       -3   9
       /   /
     -10  5

## 题目大意

将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。

## 解题思路
- 类似 105题根据一棵树的前序遍历与中序遍历构造二叉树
- 也是符合全排列写的DFS模版
```
//二种选择
//选择左 = 进入下一层
root.left = buildTree(nums, start, end: middle-1)
//选择右 = 进入下一层
root.right = buildTree(nums, middle + 1, end: end)
```
