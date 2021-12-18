//
//  PascalsTriangle.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/18.
//

import Foundation

class PascalsTriangle {

    func generate(_ numRows: Int) -> [[Int]] {

        var dp:[[Int]] = [[Int]]()

        for row in 0..<numRows {

            var res = Array(repeating: 0, count: row+1)

            for col in 0...row {

                if col == 0 || col == row {
                    res[col] = 1
                } else {

                    res[col] = dp[row-1][col] + dp[row-1][col-1]

                }

            }

            dp.append(res)
        }

        return dp
    }

}
