//
//  SurroundedRegions.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/31.
//

import Foundation

class SurroundedRegions {

    func solve(_ board: inout [[Character]]) {

        //只有一列二列直接返回
        if board[0].count <= 2 || board.count == 0{
            return
        }

        //4周边缘如果是O则先改为其他字符，进行DFS，BFS类似腐烂橘子感染其他的
        for row in 0..<board.count {

            //左右边界
            dfs(&board, (row,0))
            dfs(&board, (row,board[0].count-1))
        }

        for column in 1..<board[0].count-1 {

            //上下边界
            dfs(&board, (0,column))
            dfs(&board, (board.count-1,column))
        }

        //把其他字符改回为O，剩下没被感染的O改为X
        for row in 0..<board.count {

            for column in 0..<board[0].count {

                if board[row][column] == "A" {
                    board[row][column] = "O"
                } else if board[row][column] == "O"{
                    board[row][column] = "X"
                }

            }
        }
    }

    func dfs(_ board: inout [[Character]], _ location: (Int,Int)) {

        if location.0 < 0 || location.0 >= board.count || location.1 < 0 || location.1 >= board[0].count || board[location.0][location.1] != "O" {
            return
        }

        //将边界的O和与边界相连的O感染成“A”
        board[location.0][location.1] = "A"

        dfs(&board, (location.0 - 1,location.1))
        dfs(&board, (location.0 + 1,location.1))
        dfs(&board, (location.0,location.1 - 1))
        dfs(&board, (location.0,location.1 + 1))
    }


    var queue: QueueArray<(Int,Int)> = QueueArray()

    //BFS
    func solve2(_ board: inout [[String]]) {

        if board[0].count <= 2 || board.count == 0{
            return
        }

        //左右边界入列
        for row in 0..<board.count {

            if board[row][0] == "O"{
                board[row][0] = "A"
                queue.enqueue((row,0))
            }

            if board[row][board[0].count-1] == "O" {
                board[row][board[0].count-1] = "A"
                queue.enqueue((row,board[0].count-1))
            }

        }

        //上下边界入列
        for column in 1..<board[0].count-1 {

            if board[0][column] == "O"{
                board[0][column] = "A"
                queue.enqueue((0,column))
            }

            if board[board.count-1][column] == "O" {
                board[board.count-1][column] = "A"
                queue.enqueue((board.count-1,column))
            }

        }

        while !queue.isEmpty {

            let location = queue.dequeue()!

            if location.0 + 1 < board.count - 1 && board[location.0 + 1][location.1] == "O" {

                board[location.0 + 1][location.1] = "A"
                queue.enqueue((location.0 + 1 , location.1))

            }
            if location.0 - 1 > 0 && board[location.0 - 1][location.1] == "O" {

                board[location.0 - 1][location.1] = "A"
                queue.enqueue((location.0 - 1 , location.1))

            }
            if location.1 - 1 > 0 && board[location.0][location.1 - 1] == "O" {

                board[location.0][location.1 - 1] = "A"
                queue.enqueue((location.0 , location.1 - 1))

            }
            if location.1 + 1 < board[0].count - 1 && board[location.0][location.1 + 1] == "O" {

                board[location.0][location.1 + 1] = "A"
                queue.enqueue((location.0 , location.1 + 1))

            }
        }


        for row in 0..<board.count {

            for column in 0..<board[0].count {

                if board[row][column] == "A" {
                    board[row][column] = "O"
                } else if board[row][column] == "O"{
                    board[row][column] = "X"
                }

            }
        }

    }
}

//二周目:关键在于处理边界的O，和与其相连的O
class SurroundedRegionsII {

    //DFS
    func solve(_ board: inout [[Character]]) {

        if board[0].count <= 2 || board.count == 0 {
            return
        }

        for i in 0..<board.count {

            dfs(&board, (i,0))
            dfs(&board, (i,board[0].count-1))

        }

        for cloum in 1..<board[0].count - 1 {
            dfs(&board, (0,cloum))
            dfs(&board, (board.count-1,cloum))
        }

        for row in 0..<board.count {
            for cloumn in 0..<board[0].count {

                if board[row][cloumn] == "A" {
                    board[row][cloumn] = "O"
                } else if board[row][cloumn] == "O"{
                    board[row][cloumn] = "X"
                }
            }
        }
    }

    func dfs(_ board: inout [[Character]], _ location: (Int,Int)) {

        if location.0 < 0 || location.0 >= board.count || location.1 < 0 || location.1 >= board[0].count || board[location.0][location.1] != "O" {
            return
        }

        //将边界的O和与边界相连的O感染成“A”
        board[location.0][location.1] = "A"

        dfs(&board, (location.0 - 1,location.1))
        dfs(&board, (location.0 + 1,location.1))
        dfs(&board, (location.0,location.1 - 1))
        dfs(&board, (location.0,location.1 + 1))
    }


    //-------解法二----------
    //BFS
    func solveBFS(_ board: inout [[Character]]) {

        if board[0].count <= 2 || board.count == 0 {
            return
        }

        var queue = QueueArray<(Int,Int)>()

        for row in 0..<board.count {

            if board[row][0] == "O"{
                board[row][0] = "A"
                queue.enqueue((row,0))
            }

            if board[row][board[0].count-1] == "O" {
                board[row][board[0].count-1] = "A"
                queue.enqueue((row,board[0].count-1))
            }


        }

        for column in 1..<board[0].count-1 {

            if board[0][column] == "O"{
                board[0][column] = "A"
                queue.enqueue((0,column))
            }

            if board[board.count-1][column] == "O" {
                board[board.count-1][column] = "A"
                queue.enqueue((board.count-1,column))
            }

        }

        while !queue.isEmpty {

            let location = queue.dequeue()!


            if location.0 + 1 < board.count - 1 && board[location.0 + 1][location.1] == "O" {

                board[location.0 + 1][location.1] = "A"
                queue.enqueue((location.0 + 1 , location.1))

            }
            if location.0 - 1 > 0 && board[location.0 - 1][location.1] == "O" {

                board[location.0 - 1][location.1] = "A"
                queue.enqueue((location.0 - 1 , location.1))

            }
            if location.1 - 1 > 0 && board[location.0][location.1 - 1] == "O" {

                board[location.0][location.1 - 1] = "A"
                queue.enqueue((location.0 , location.1 - 1))

            }
            if location.1 + 1 < board[0].count - 1 && board[location.0][location.1 + 1] == "O" {

                board[location.0][location.1 + 1] = "A"
                queue.enqueue((location.0 , location.1 + 1))

            }
        }

        for row in 0..<board.count {

            for column in 0..<board[0].count {

                if board[row][column] == "A" {
                    board[row][column] = "O"
                } else if board[row][column] == "O"{
                    board[row][column] = "X"
                }

            }
        }

    }

}
