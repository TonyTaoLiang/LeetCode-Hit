# [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)


## 题目

Given a 2d grid map of `'1'`s (land) and `'0'`s (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

**Example 1:**

    Input:
    11110
    11010
    11000
    00000
    
    Output: 1

**Example 2:**

    Input:
    11000
    11000
    00100
    00011
    
    Output: 3

## 题目大意

给定一个由 '1'（陆地）和 '0'（水）组成的的二维网格，计算岛屿的数量。一个岛被水包围，并且它是通过水平方向或垂直方向上相邻的陆地连接而成的。你可以假设网格的四个边均被水包围。


## 解题思路

- 要求找出地图中的孤岛。孤岛的含义是四周被海水包围的岛。
- 方法一：DFS
我们可以将二维网格看成一个无向图，竖直或水平相邻的 11 之间有边相连。

为了求出岛屿的数量，我们可以扫描整个二维网格。如果一个位置为 1，则以其为起始节点开始进行DFS。在DFS的过程中，每个搜索到的 1 都会被重新标记为 0。最终岛屿的数量就是我们进行DPS的次数。

- 方法二：BFS
同样地，我们也可以使用BFS代替DFS。

为了求出岛屿的数量，我们可以扫描整个二维网格。如果一个位置为 1，则将其加入队列，开始进行BFS。在BFS的过程中，每个搜索到的 1都会被重新标记为 0。直到队列为空，搜索结束。

最终岛屿的数量就是我们进行BFS的次数。



