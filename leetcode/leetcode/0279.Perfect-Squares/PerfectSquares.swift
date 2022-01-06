//
//  PerfectSquares.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/6.
//

import Foundation

class PerfectSquares {

    func numSquares(_ n: Int) -> Int {

        var dp = Array(repeating: Int.max - 1, count: n + 1)

        dp[0] = 0
        
        for i in 1...n {

            for j in 1...Int(sqrt(Double(n))) {

                if i - j*j >= 0 {
                    dp[i] = min(dp[i], dp[i - j*j] + 1)
                }

            }

        }

        return dp[n]
    }
}
