//
//  MaximumSubarray.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/11/1.
//

import Foundation

class MaximumSubarray {
    func maxSubArray(nums: [Int]) -> Int {

        var currentDPStatus = nums[0]
        var finalDPStatus = nums[0]

        for i in 1..<nums.count {
            /**
             我们把整个求解过程分为 n 个阶段，每个阶段会决策一个元素重开，还是加入上一个状态
             如果f(i-1)currentDPStatus<= 0  那么重新开一局
             f(i) = num(i), 如果f(i-1)currentDPStatus > 0 那么就把上一个状态currentDPStatus加进去
             动态转移方程：
             dp[i] = nums[i] + dp[i-1] (dp[i-1] > 0)`，`dp[i] = nums[i] (dp[i-1] ≤ 0)`

             -2 1 -3 4 -1 2 1 -5 4           -2 1 -3 4 -1 2 1 -5 4
                                       ->
             -2 1 -3 4 -1 2 1 -5 4           -2 1 -2 4  3 5 6  1 5
             currentDPStatus每个阶段依次是-2 1 -2 4  3 5 6  1 5 ，从中选择一个最大的
             */
            currentDPStatus = max(currentDPStatus + nums[i], nums[i])
            finalDPStatus = max(finalDPStatus, currentDPStatus)

        }

        return finalDPStatus

    }
}
