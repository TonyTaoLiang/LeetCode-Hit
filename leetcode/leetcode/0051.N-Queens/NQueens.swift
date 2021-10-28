//
//  NQueens.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/10/28.
//

import Foundation
class NQueens {

    func solveNQueens(_ n: Int) -> [[String]] {

        guard n > 0 else {
            return [[String]]()

        }

        //所有解
        var boards: [[String]] = [[String]]()
        //某一组解
        var board: [String] = Array(repeating: "", count: n)

        bfs(&boards, &board, n, 0)

        return boards
    }

    private func bfs(_ boards: inout [[String]], _ board: inout [String], _ n: Int , _ row: Int){

        if row == n {
            //将此组解加入结果
            //Array(board)创建一个新的实例，因为后面board是传入的地址，后面会不断重置它（有某一组新的解，或者回溯的时候）
            boards.append(Array(board))
            return
        }

        //每一行n列种放法（这里就是回溯的地方）
        for col in 0..<n {

            if isValid(board, col, row) {

                //回溯或者成功就开始设置当前这一row的解
                board[row] = setRow(col, n)
                //下一行
                bfs(&boards, &board, n, row+1)

            }
        }

    }

    private func isValid(_ board: [String], _ col: Int , _ row: Int) -> Bool{

        //Q的位置
        var locate = -1

        //依次查询上面的行
        for i in 0..<row {

            //找出Q的位置
            for j in 0..<board[0].count {

                if charAt(board[i], j) == "Q"{
                    locate = j
                    break
                }

            }

            //正上方
            if locate == col {
                return false
            }

            //对角线(列差=行差)
            if abs(locate - col) == abs(i - row) {
                return false
            }
        }



        return true

    }


    private func charAt(_ string: String, _ col: Int) -> Character{

        return string[string.index(string.startIndex, offsetBy: col)]

    }

    private func setRow(_ col: Int , _ n: Int) -> String{

        var row = ""

        for i in 0..<n {

            if col == i {
                row.append("Q")
            } else {
                row.append(".")
            }

        }

        return row
    }
}
