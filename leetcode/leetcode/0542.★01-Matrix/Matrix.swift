//
//  Matrix.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/12.
//

import Foundation

class Matrix{

    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {

        if mat.count <= 0 {
            return mat
        }

        var dist:[[Int]] = Array(repeating: Array(repeating: Int.max - 10000, count: mat[0].count), count: mat.count)

        //第一次遍历 从上往下，从左往右遍历矩阵，这时先计算出来的是左，上
        for i in 0..<mat.count {

            for j in 0..<mat[0].count {

                if mat[i][j] == 0 {
                    dist[i][j] = 0
                }else {

                    if i > 0 {
                        dist[i][j] = min(dist[i][j], dist[i-1][j] + 1)
                    }

                    if j > 0 {
                        dist[i][j] = min(dist[i][j], dist[i][j-1] + 1)
                    }
                }
            }

        }

        //第二次从下往上，从右往左遍历矩阵，这时先计算出来的是右，下. 同时不用if mat[i][j] == 0 {dist[i][j] = 0} 第一步已经做过
        for i in (0..<mat.count).reversed() {

            for j in (0..<mat[0].count).reversed() {


                if i < mat.count - 1 {
                    dist[i][j] = min(dist[i][j], dist[i+1][j] + 1)
                }

                if j <  mat[0].count - 1{
                    dist[i][j] = min(dist[i][j], dist[i][j+1] + 1)
                }

            }

        }

        return dist

    }

}
