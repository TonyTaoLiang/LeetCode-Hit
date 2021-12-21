//
//  NumbersOfIsland.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/21.
//

import Foundation

class NumbersOfIsland{

    var offset = [
        [-1,0],
        [1,0],
        [0,-1],
        [0,1]
    ]

    func numIslands(_ grid: [[String]]) -> Int {

        var mutableGrid = grid
        var count = 0
        //遍历从一个1开始
        for row in 0..<mutableGrid.count {

            for col in 0..<mutableGrid[0].count {

                if mutableGrid[row][col] == "1" {

                    //开始DFS
                    dfsIsland(&mutableGrid, row, col)
                    //一次dfs就代表一个岛，然后再去找下一个1
                    count += 1
                }
            }

        }

        return count
    }

    private func dfsIsland(_ mutableGrid: inout [[String]], _ row: Int, _ col: Int){

        //边界
        if  row < 0 || row > mutableGrid.count - 1 || col < 0 || col > mutableGrid[0].count - 1   || mutableGrid[row][col] == "0"{
            return
        }

        //1变0
        mutableGrid[row][col] = "0"

        //每一层4种选择 上下左右
        for i in 0..<4 {
            dfsIsland(&mutableGrid, row+offset[i][0], col+offset[i][1])
        }

    }

}
