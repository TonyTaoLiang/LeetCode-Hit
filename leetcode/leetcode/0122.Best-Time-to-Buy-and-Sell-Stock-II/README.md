# [122. Best Time to Buy and Sell Stock II](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)


## 题目

Say you have an array for which the *i*th element is the price of a given stock on day *i*.

Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

**Note:** You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

**Example 1:**

    Input: [7,1,5,3,6,4]
    Output: 7
    Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
                 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.

**Example 2:**

    Input: [1,2,3,4,5]
    Output: 4
    Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
                 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
                 engaging multiple transactions at the same time. You must sell before buying again.

**Example 3:**

    Input: [7,6,4,3,1]
    Output: 0
    Explanation: In this case, no transaction is done, i.e. max profit = 0.

## 题目大意

给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。


## 解题思路

- 这一题是第 121 题的加强版。要求输出最大收益，这一题不止买卖一次，可以买卖多次，买卖不能在同一天内操作。
- 最大收益来源，必然是每次跌了就买入，涨到顶峰的时候就抛出。只要有涨峰就开始计算赚的钱，连续涨可以用两两相减累加来计算，两两相减累加，相当于涨到波峰的最大值减去谷底的值。这一点看通以后，题目非常简单。
    (其实这就是贪心) 这道题 「贪心」 的地方在于，对于 「今天的股价 - 昨天的股价」，得到的结果有 3 种可能：① 正数，② 0，③负数。贪心算法的决策是： 只加正数 。
    
- 贪心选择性质的证明：

    借助 「差分」 这个概念，可以证明 「贪心算法」 的有效性。贪心算法是选择那些所有差分（严格）大于 0 的数，把它们相加即可。

    使用反证法：

    假设 「贪心算法」 得到的解并不是最优解，即我们还能够找到一个可行解比 「贪心算法」 得到的利润还多。差分数组中除了差分为正数的项以外，还有就是差分为 00 的项与差分为负数的项。「贪心算法」 是所有差分为正数的项的和。有以下 33 种情况：

    如果可行解在 「贪心算法」 的基础上，选择了差分为 00 的项，得到的结果与「贪心算法」得到的结果一样，因此加上差分为 00 的项不会比「贪心算法」得到的结果更好；
    如果可行解在 「贪心算法」 的基础上，选择了差分为负数的项，加上一个负数得到的结果一定比 「贪心算法」 得到的结果要少，加上差分为负数的项，一定比 「贪心算法」 得到的结果更少；
    如果可行解在 「贪心算法」 的基础上，去掉了任何一个差分为正数的项，同上，得到的结果一定比 「贪心算法」 得到的结果要小，因此，「贪心算法」 的所有组成项不能删去任何一个。
    综上，除了 「贪心算法」 以外，找不到一个更优的解法，因此 「贪心算法」 就是最优解。（证完）
