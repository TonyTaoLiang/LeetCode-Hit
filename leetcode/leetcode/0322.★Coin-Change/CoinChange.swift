//
//  CoinChange.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/5.
//

import Foundation

class CoinChange {

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {

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
