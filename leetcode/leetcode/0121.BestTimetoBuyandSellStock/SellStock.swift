//
//  SellStock.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/17.
//

import Foundation

class SellStock{

    //[7,1,5,3,6,4] 1 6 5
    //[7,6,4,3,1] 0

    func maxProfit(_ prices: [Int]) -> Int {

        //i天买入 j天卖出 一维数组就行 下标表示第几天买入

//        var dp = Array(repeating: 0, count: prices.count)
        //直接用一个int变量就可以
//        var res = 0
//        for i in 0..<prices.count-1 {
//
//            for j in i+1..<prices.count {
//
//                res = max(res, prices[j] - prices[i])
//
//            }
//
//        }

//        var res = dp[0]
//        for i in 1..<dp.count {
//            res = max(res,dp[i])
//        }

        //使用双层for超出时间限制，其实一层循环就够，如果找到一个比当前对比元素（一开始是第一个元素）小的元素，
        //则把对比元素(买入的那一天)更换为小的这一个，因为后面再卖的，这小的对比元素肯定更赚
        var res = 0
        var compare = prices[0]
        //遍历卖的那一天
        for i in 1..<prices.count {

            res = max(prices[i] - compare, res)

            if prices[i] < compare {
                compare = prices[i]
            }
        }

        return res
    }

}
