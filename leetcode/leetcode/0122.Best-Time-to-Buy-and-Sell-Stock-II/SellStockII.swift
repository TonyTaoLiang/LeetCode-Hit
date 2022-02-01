//
//  SellStockII.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/30.
//

import Foundation

class SellStockII {

    //与121题的区别在于，此次可以不限制交易次数。121只交易一次

    //解法一：DP (关键在于怎么定义这个状态，和转移方程)
    //1.定义状态
    //状态dp[i][j] 表示到下标为 i 的这一天，持股状态为 j 时，我们手上拥有的最大现金数。
    //那么j有2个状态0/1，分别表示这一天持有股票/不持有股票

    //2.转移方程（每一天有2个状态，每次只持有一个股票）
    //（1）当前不持有股票，若前一天也不持有则保持不变，若前一天持有，因为今天是不持有股票所以应该以今天的价格卖出
    //dp[i][0] = Math.max(dp[i - 1][0], dp[i - 1][1] + prices[i]);
    //（2）当前持有股票，若前一天也持有则保持，若前一天不持有，因为今天是持有股票所以应该是以今天的价格买入
    //dp[i][1] = Math.max(dp[i - 1][1], dp[i - 1][0] - prices[i]);

    func maxProfit(_ prices: [Int]) -> Int {

        var dp:[[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)

        //初始值
        dp[0][0] = 0
        //因为持有了股票，所以支出了现金，为负
        dp[0][1] = -prices[0]

        for i in 1..<prices.count {

            //卖出
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
            //买入
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])
        }

        //dp[i][0]不持有股票肯定比dp[i][1]持有股票时手上的现金更多
        return dp[prices.count-1][0]
    }

    //DP优化：将二维数组优化成2个变量，滚动覆盖取值(想象一个二维数组表)
    /**
        0         1
      —————————————————
     |  sell  |  hold  | 第一天
     |  sell  |  hold  | 第二天
     |  sell  |  hold  | 第三天
     |  sell  |  hold  | 第四天
      —————————————————
     */
    func maxProfit1(_ prices: [Int]) -> Int {

        var sell = 0
        var hold = -prices[0]

        for i in 1..<prices.count {

            sell = max(sell, hold+prices[i])
            hold = max(hold, sell-prices[i])
        }

        return sell
    }

    //解法二：贪心
    //这道题 「贪心」 的地方在于，对于 「今天的股价 - 昨天的股价」，得到的结果有 3 种可能：① 正数，② 0，③负数。贪心算法的决策是： 只加正数 。
    //贪心选择性质的证明见README

    func maxProfit2(_ prices: [Int]) -> Int {

        var res = 0

        for i in 0..<prices.count - 1 {

            if prices[i+1] - prices[i] > 0 {

                res += prices[i+1] - prices[i]

            }

        }

        return res

    }
}
