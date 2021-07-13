# [226. InvertTree](https://leetcode-cn.com/problems/invert-binary-tree/)

## 题目

翻转一棵二叉树。

Example:

```
输入：

     4
   /   \
  2     7
 / \   / \
1   3 6   9
输出：

     4
   /   \
  7     2
 / \   / \
9   6 3   1

这个问题是受到 Max Howell 的 原问题 启发的 ：

谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。

```



## 题目大意



## 解题思路

类似于二叉树遍历的思想。也有点归并排序递归的感觉
先递归调用反转根节点的左孩子，然后递归调用反转根节点的右孩子，然后左右交换根节点的左孩子和右孩子。
条件：当传入的root为nil则结束
公式：invert(root) = invert(root.left) + invert(root.right)

