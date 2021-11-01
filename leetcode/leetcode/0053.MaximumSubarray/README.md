# [53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)


## 题目

Given an integer array `nums`, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

**Example:**


    Input: [-2,1,-3,4,-1,2,1,-5,4],
    Output: 6
    Explanation: [4,-1,2,1] has the largest sum = 6.


**Follow up:**

If you have figured out the O(*n*) solution, try coding another solution using the divide and conquer approach, which is more subtle.

## 题目大意

给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

## 解题思路

- 这一题可以用 DP 求解也可以不用 DP。
- 题目要求输出数组中某个区间内数字之和最大的那个值。`dp[i]` 表示 `[0,i]` 区间内各个子区间和的最大值，状态转移方程是 `dp[i] = nums[i] + dp[i-1] (dp[i-1] > 0)`，`dp[i] = nums[i] (dp[i-1] ≤ 0)`。这个方程跟leetcode官方题解的视频吻合。
- leetcode官方题解的文字描述如下，跟swift的代码吻合

我们只需要求出每个位置的 f(i)，然后返回 f 数组中的最大值即可。那么我们如何求 f(i)呢？我们可以考虑 nums[i] 单独成为一段还是加入 f(i-1) 对应的那一段，这取决于 nums[i] 和
f(i-1) +nums[i] 的大小，我们希望获得一个比较大的，于是可以写出这样的动态规划转移方程：
f(i)=max{f(i−1)+nums[i],nums[i]}

-总结：其实视频描述和文字描述是一个意思，我们把整个求解过程分为 n 个阶段，每个阶段会决策一个元素重开，还是加入上一个状态。
如果f(i-1)<= 0  那么重新开一局 
f(i) = num(i), 如果f(i-1) > 0 那么就把上一个状态加进去。 最后从所有的状态f(i)
中找到一个最大的。
