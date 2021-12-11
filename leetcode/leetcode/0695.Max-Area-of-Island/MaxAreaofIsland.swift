//
//  MaxAreaofIsland.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/11.
//

import Foundation

class MaxAreaofIsland{

    //上下左右
    var dir: [[Int]] = [

        [-1,0],
        [0,1],
        [1,0],
        [0,-1]

    ]

    var ans = 0

    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {

        var mutableGrid = grid
        //遍历所有的起始点
        for sr in 0..<grid.count {

            for sc in 0..<grid[0].count {

                ans = max(ans, dfsIsland(&mutableGrid, sr, sc))

            }
        }

        return ans
    }

    func isInIsland(_ grid: [[Int]], _ sr: Int, _ sc: Int) -> Bool{

        return sr >= 0 && sr < grid.count && sc >= 0 && sc < grid[0].count

    }

    func dfsIsland(_ grid: inout [[Int]], _ sr: Int, _ sc: Int) -> Int {

        if !isInIsland(grid, sr, sc) || grid[sr][sc] == 0{
            return 0
        }

        //把1置为0 防止此点重复计算 即重复计算岛屿
        grid[sr][sc] = 0

        var total = 1

        //上下左右开始递归
        for i in 0..<4 {

            let msr = sr + dir[i][0]
            let msc = sc + dir[i][1]

            total += dfsIsland(&grid, msr, msc)

        }

        return total
    }
}
