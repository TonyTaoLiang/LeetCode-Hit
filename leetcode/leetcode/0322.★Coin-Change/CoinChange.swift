//
//  CoinChange.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/5.
//

import Foundation

class CoinChange {

    //解法一：DP(注意dp初始化的数值，不能是Int.max，否则dp[i - coins[j]] + 1溢出)
    //DP的关键在于：1.求的是什么?是硬币的最小个数，那么dp[i]中存放的就是硬币的个数
    //            2.转移方程? dp[i]的硬币个数能由几种情况转移过来？dp[i - coins[j]]
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {

        if amount == 0 {
            return 0
        }

//        var dp = Array(repeating: amount + 1, count: amount + 1)
        var dp = Array(repeating: Int.max - 1, count: amount + 1)
        dp[0] = 0

        //双层循环对应着<DP硬币兑换.jpg>
        for i in 1...amount {

            for j in 0..<coins.count {

                if i - coins[j] >= 0 {
                    dp[i] = min(dp[i], dp[i - coins[j]] + 1)

                }

            }

        }
        return dp[amount] == Int.max ? -1 : dp[amount]
//        return dp[amount] > amount ? -1 : dp[amount]
    }

    //解法二：
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {

        if amount == 0 {
            return 0
        }

        let res = dfs(coins, amount)

        return res

    }

    //解法二：记忆搜索:(备忘录) 递归函数加一个返回值 表示当前coinValue需要的硬币数
    var memo = [Int : Int]()

    private func dfs(_ coins: [Int], _ amount: Int) -> Int{

        //找不过来
        if amount < 0{
            return -1
        }

        //正好找完
        if amount == 0 {
            return 0
        }

        //有缓存
        if memo[amount] != nil {
            return memo[amount]!
        }

        var min = Int.max

        for i in 0..<coins.count {
            var amounts = amount
            amounts -= coins[i]
            let res: Int = dfs(coins, amounts)
            if res >= 0 && res < min {
                min = res + 1
            }

        }

        //找不过来 就把-1 层层上传
        memo[amount] = min == Int.max ? -1 : min

        return memo[amount]!
    }

    //直接递归 套用DFS模版 时间复杂度太高(不采用)
    private func dfs1(_ coins: [Int], _ amount: Int, _ coinCount: inout Int, _ coinValue: inout Int, _ res: inout Int) {

        if coinValue >= amount {

            if coinValue == amount {
                res = min(res, coinCount)
            }

            return
        }

        
        for i in 0..<coins.count {

            coinValue += coins[i]
            coinCount += 1
            dfs1(coins, amount, &coinCount, &coinValue, &res)
            coinValue -= coins[i]
            coinCount -= 1
        }

    }
}
