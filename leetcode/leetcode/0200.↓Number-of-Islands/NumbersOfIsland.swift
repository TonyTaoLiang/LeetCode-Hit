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
    //解法一：DFS
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


    //解法二：BFS 类似腐烂的橘子
    func numIslands2(_ grid: [[String]]) -> Int {

        var mutableGrid = grid
        var count = 0
        var queue = QueueArray<(Int,Int)>()
        //遍历从一个1开始
        for row in 0..<mutableGrid.count {

            for col in 0..<mutableGrid[0].count {

                if mutableGrid[row][col] == "1" {

                    //1变0 入列就变0
                    mutableGrid[row][col] = "0"
                    //开始入列
                    queue.enqueue((row,col))

                    while !queue.isEmpty {

                        let locate = queue.dequeue()!

                        //*****************Important************************
                        //不能在dequeue的时候再 1变0 这样十字交叉的位置会反复入列 。因此入列一个，变0一个
//                        mutableGrid[locate.0][locate.1] = "0"

                        //上
                        if locate.0 - 1 >= 0 && mutableGrid[locate.0 - 1][locate.1] == "1"{

                            queue.enqueue((locate.0 - 1,locate.1))
                            mutableGrid[locate.0 - 1][locate.1] = "0"
                        }
                        //下
                        if locate.0 + 1 < mutableGrid.count && mutableGrid[locate.0 + 1][locate.1] == "1"{

                            queue.enqueue((locate.0 + 1,locate.1))
                            mutableGrid[locate.0 + 1][locate.1] = "0"
                        }

                        //左
                        if locate.1 - 1 >= 0 && mutableGrid[locate.0][locate.1 - 1] == "1"{

                            queue.enqueue((locate.0,locate.1 - 1))
                            mutableGrid[locate.0][locate.1 - 1] = "0"
                        }

                        //右
                        if locate.1 + 1 < mutableGrid[0].count && mutableGrid[locate.0][locate.1 + 1] == "1"{

                            queue.enqueue((locate.0,locate.1 + 1))
                            mutableGrid[locate.0][locate.1 + 1] = "0"
                        }
                    }

                    //一次bfs就代表一个岛，然后再去找下一个1
                    count += 1
                }
            }

        }

        return count
    }
}
