//
//  Triangle.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/16.
//

import Foundation

class Triangle{


    //解法一 倒序 DP
//    [[-1],
//    [2,3],       -97 1
//    [1,-1,-3],   -99 0 -2 1
//    [-100,1,2,1]]

    //自己的错误思路：倒着来，从最后一层的每个节点 往上推 。无非最后的落点就是最后一层的某一个节点
    //每次先循环最后一列，再套着循环行，不太对，最后思路混乱。
    //其实按照霜神的思路。从倒数第二层开始（因为要计算triangle[row+1][col]）依次往上。每次把每层每个元素可以取得的最小值计算出来。累加

    //霜神思路
    func minimumTotal1(_ triangle: [[Int]]) -> Int {

        var mutableTrangel = triangle

        for row in (0..<mutableTrangel.count-1).reversed() {

            //计算每一层每一个元素可以取得的最小值
            for col in 0..<mutableTrangel[row].count {
                mutableTrangel[row][col] += min(mutableTrangel[row+1][col], mutableTrangel[row+1][col+1])
            }

        }

        return mutableTrangel[0][0]
    }
    //优化下空间复杂度（但时间复杂度很高）
    func minimumTotal2(_ triangle: [[Int]]) -> Int {

        var array = triangle[triangle.count-1]

        for row in (0..<triangle.count-1).reversed() {

            //计算每一层每一个元素可以取得的最小值
            for col in 0..<triangle[row].count {

                array[col] = triangle[row][col] + min(array[col], array[col+1])

            }

        }

        return array[0]
    }

    //解法二 正序 DP 时间复杂度100% 空间还能优化
    func minimumTotal4(_ triangle: [[Int]]) -> Int {

        //表示走到第i行第j列的最小路径和
        var dp:[[Int]] = Array(repeating: Array(repeating: 0, count: triangle[triangle.count-1].count), count: triangle.count)

        //初始化第一个元素
        dp[0][0] = triangle[0][0]

        for row in 1..<triangle.count {

            for col in 0..<triangle[row].count {

                if col == 0 {//第一个元素只能由第一个转移过来
                    dp[row][col] = dp[row-1][0] + triangle[row][col]
                } else if(col==row){//最后一个元素只能由上一层最后转移过来
                    dp[row][col] = dp[row-1][col-1] + triangle[row][col]
                } else {
                    dp[row][col] = min(dp[row-1][col-1],dp[row-1][col]) + triangle[row][col]
                }

            }

        }

        var res = dp[triangle.count-1][0]
        for i in 1..<dp[triangle.count-1].count {

            res = min(res,dp[triangle.count-1][i])

        }
        return res
    }

    //解法二 正序 DP 空间复杂度优化
    func minimumTotal(_ triangle: [[Int]]) -> Int {

        //表示走到第i行第j列的最小路径和
        var dp:[Int] = Array(repeating: 0, count: triangle[triangle.count-1].count)

        //初始化第一个元素
        dp[0] = triangle[0][0]

        for row in 1..<triangle.count {

            //倒着计算 不然被覆盖
            for col in (0..<triangle[row].count).reversed() {

                if col == 0 {//第一个元素只能由第一个转移过来
                    dp[col] = dp[0] + triangle[row][col]
                } else if(col==row){//最后一个元素只能由上一层最后转移过来
                    dp[col] = dp[col-1] + triangle[row][col]
                } else {

                    dp[col] = min(dp[col-1],dp[col]) + triangle[row][col]
                }

            }

        }

        var res = dp[0]
        for i in 1..<dp.count {

            res = min(res,dp[i])

        }
        return res
    }

    //错误思路
    func minimumTotalWrong(_ triangle: [[Int]]) -> Int {

        if triangle.count == 1 {
            return triangle[0][0]
        }
        
        //最后一层每一个节点从下往上得出一个结果
        var res: [Int] = Array(repeating: 0, count: triangle.count)

        let n = triangle.count

        //倒着从最后一层依次选一个
        for i in 0..<triangle[n-1].count {

            res[i] += triangle[n-1][i]

            //第一行加入
            res[i] += triangle[0][0]

            //随时替换下标
            var currentIndex = i
            //依次往上走
            for j in (1..<triangle.count-1).reversed() {

                if currentIndex == 0 {//特殊处理第一个元素
                    res[i] += triangle[j][currentIndex]

                }else if(currentIndex == triangle[j].count){//特殊处理最后一个元素，超出上一层range
                    res[i] += triangle[j][currentIndex-1]
                    currentIndex = currentIndex - 1

                }else{

                    if triangle[j][currentIndex] > triangle[j][currentIndex-1] {
                        res[i] += triangle[j][currentIndex-1]
                        currentIndex = currentIndex - 1
                    }else{
                        res[i] += triangle[j][currentIndex]
                    }
                }

            }

        }

        var temp = res[0]

        for i in 1..<res.count {
            temp = min(temp, res[i])
        }

        return temp
    }

}
