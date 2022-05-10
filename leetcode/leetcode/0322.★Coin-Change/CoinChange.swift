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


    //二周目
    func coinChangeII(_ coins: [Int], _ amount: Int) -> Int {

        if amount == 0 {
            return 0
        }

        var dp = Array(repeating: Int.max, count: amount+1)

        //DP是顺着amount来，递归正相反
        for i in 1...amount {

            for j in 0..<coins.count {

                if i - coins[j] >= 0 {
                    //当前这一行的状态可以由dp[i - coins[j]]这几种状态转移而来,存入这几种状态中的最小值
                    dp[i] = min(dp[i], dp[i - coins[j]] + 1)
                }

            }
        }

        return dp[amount] == Int.max ? -1 : dp[amount]
    }

    func coinChangeIISecond(_ coins: [Int], _ amount: Int) -> Int {

        if amount == 0 {
            return 0
        }
        return dfsII(coins, amount)
    }

    var memos: [Int : Int] = [Int : Int]()

    func dfsII(_ coins: [Int], _ amount: Int) -> Int {

        if amount < 0 {
            return -1
        }

        if amount == 0 {
            return 0
        }

        if memos[amount] != nil {
            return memos[amount]!
        }

        var mins = Int.max

        //每次几种选择
        for i in 0..<coins.count {

            //递归是倒着amount来（f(6)->f(5)...f(4)..），DP正相反
            //不能取min，不然如果有一种选择是-1，所有选择都是-1.
            //                mins = min(mins,dfsII(coins, amount - coins[i]))
            let res = dfsII(coins, amount - coins[i])
            //取选择中较小的一个
            if res >= 0 &&  res < mins{
                mins = res + 1
            }


        }

        memos[amount] = mins == Int.max ? -1 : mins

        return memos[amount]!
    }

}

//三周目
class CoinChangeII {

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {

        var dp = Array(repeating: Int.max-1, count: amount+1)

        dp[0] = 0

        for i in 1...amount {

            for j in 0..<coins.count {

                if i - coins[j] >= 0 {

                    dp[i] = min(dp[i], dp[i - coins[j]] + 1)
                }

            }
        }

        return dp[amount] == Int.max ? -1 : dp[amount]
    }


    func coinChangeII(_ coins: [Int], _ amount: Int) -> Int {


        return dfs(coins, amount)
    }

    var memo: [Int : Int] = [Int : Int]()

    func dfs(_ coins: [Int], _ amount: Int) -> Int {

        if amount < 0 {
            return -1
        }

        if amount == 0 {
            return 0
        }

        if memo[amount] != nil {
            return memo[amount]!
        }

        var min = Int.max

        for i in 0..<coins.count {

            let res = dfs(coins, amount - coins[i])
            if res > 0 && res < min {
                min = res + 1
            }

        }

        memo[amount] = min == Int.max ? -1 : min

        return memo[amount]!

    }
}
