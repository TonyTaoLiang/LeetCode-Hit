# [944. Rotting Oranges](https://leetcode-cn.com/problems/rotting-oranges/)


## 题目

You are given an m x n grid where each cell can have one of three values:

0 representing an empty cell,
1 representing a fresh orange, or
2 representing a rotten orange.
Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.



**Example 1:**

Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
Output: 4

**Example 2:**

Input: grid = [[2,1,1],[0,1,1],[1,0,1]]
Output: -1
Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.


**Note:**

m == grid.length
n == grid[i].length
1 <= m, n <= 10
grid[i][j] is 0, 1, or 2.


## 题目大意


实际上就是求腐烂橘子到所有新鲜橘子的最短路径

## 解题思路
和542题类似都可以使用BFS。542还可以使用DP。这题用DP不太对，解不出来？？？
实际上就是求腐烂橘子到所有新鲜橘子的最短路径
一开始，我们找出所有腐烂的橘子，将它们放入队列，作为第 0 层的结点。
然后进行 BFS 遍历，每个结点的相邻结点可能是上、下、左、右四个方向的结点，注意判断结点位于网格边界的特殊情况。
由于可能存在无法被污染的橘子，我们需要记录新鲜橘子的数量。在 BFS 中，每遍历到一个橘子（污染了一个橘子），就将新鲜橘子的数量减一。如果 BFS 结束后这个数量仍未减为零，说明存在无法被污染的橘子。

[理清思路：为什么用 BFS，以及如何写 BFS 代码](https://leetcode-cn.com/problems/rotting-oranges/solution/li-qing-si-lu-wei-shi-yao-yong-bfsyi-ji-ru-he-xie-/)
