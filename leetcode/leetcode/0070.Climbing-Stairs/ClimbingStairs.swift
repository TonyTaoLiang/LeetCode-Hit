//
//  ClimbingStairs.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/15.
//

import Foundation

class ClimbingStairs {

    func climbStairs(_ n: Int) -> Int {

        if n == 1 {
            return 1
        }

        var dp = Array(repeating: 1, count: n + 1)

        for i in 2...n {

            dp[i] = dp[i-1] + dp[i-2]

        }

        return dp[n]
    }


}
