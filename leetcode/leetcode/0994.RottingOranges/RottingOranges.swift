//
//  RottingOranges.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/12.
//

import Foundation

class RottingOranges{

//    实际上就是求腐烂橘子到所有新鲜橘子的最短路径
//    一开始，我们找出所有腐烂的橘子，将它们放入队列，作为第 0 层的结点。
//    然后进行 BFS 遍历，每个结点的相邻结点可能是上、下、左、右四个方向的结点，注意判断结点位于网格边界的特殊情况。
//    由于可能存在无法被污染的橘子，我们需要记录新鲜橘子的数量。在 BFS 中，每遍历到一个橘子（污染了一个橘子），就将新鲜橘子的数量减一。如果 BFS 结束后这个数量仍未减为零，说明存在无法被污染的橘子。

    func orangesRotting(_ grid: [[Int]]) -> Int {

        //用一个元组来表示入列的烂橘子的坐标
        var queue = QueueArray<(Int,Int)>()

        //好橘子数量
        var count = 0

        for i in 0..<grid.count {

            for j in 0..<grid[0].count {

                if (grid[i][j] == 1) {
                    count += 1;
                    // 腐烂的橘子就放进队列
                } else if (grid[i][j] == 2) {
                    // 缓存腐烂橘子的坐标
                    queue.enqueue((i,j))
                }

            }

        }

        //round 表示腐烂的轮数，或者分钟数
        var round = 0

        // 如果有新鲜橘子 并且 队列不为空
        // 直到上下左右都触及边界 或者 被感染的橘子已经遍历完

        while let locate = queue.dequeue() {

            if count == 0 {
                return round
            }

            

        }

        while count > 0 && !queue.isEmpty {





        }


        // 如果此时还有健康的橘子
        // 返回 -1
        // 否则 返回层级
        if (count > 0) {
            return -1;
        } else {
            return round;
        }
    }


    //这个动态规划的方法失败了。。。。和542题不太一样。。。有点没想明白，先用上述BFS解决
    func orangesRotting2(_ grid: [[Int]]) -> Int {

        if grid.count <= 0 {
            return -1
        }


        var minutes:[[Int]] = Array(repeating: Array(repeating: 100, count: grid[0].count), count: grid.count)

        //第一次遍历 从上往下，从左往右遍历矩阵，这时先计算出来的是左，上
        for i in 0..<grid.count {

            for j in 0..<grid[0].count {

                if grid[i][j] == 0 {
                    //空格子
                    minutes[i][j] = 0
                }else if grid[i][j] == 2 {
                    //烂橘子
                    minutes[i][j] = 0
                }else {

                    if i > 0 && grid[i-1][j] != 0{
                        minutes[i][j] = min(minutes[i][j], minutes[i-1][j] + 1)
                    }

                    if j > 0 && grid[i][j-1] != 0{
                        minutes[i][j] = min(minutes[i][j], minutes[i][j-1] + 1)
                    }
                }
            }

        }

        //第二次从下往上，从右往左遍历矩阵，这时先计算出来的是右，下. 同时不用if grid[i][j] == 0 {minutes[i][j] = 0} 第一步已经做过
        for i in (0..<grid.count).reversed() {

            for j in (0..<grid[0].count).reversed() {


                if i < grid.count - 1 && grid[i+1][j] != 0{
                    minutes[i][j] = min(minutes[i][j], minutes[i+1][j] + 1)
                }

                if j <  grid[0].count - 1 && grid[i][j+1] != 0{
                    minutes[i][j] = min(minutes[i][j], minutes[i][j+1] + 1)
                }

            }

        }


        var res = -1

        print(minutes)

        for i in 0..<minutes.count {

            for j in 0..<minutes[0].count {

                if minutes[i][j] >= 100 {
                    //说明好橘子不会被污染
                    return -1
                }else{

                    res = max(res, minutes[i][j])
                }

            }

        }
        return res
    }

}
//
//[[2,0,1,1,1,1,1,1,1,1],
// [1,0,1,0,0,0,0,0,0,1],
// [1,0,1,0,1,1,1,1,0,1],
// [1,0,1,0,1,0,0,1,0,1],
// [1,0,1,0,1,0,0,1,0,1],
// [1,0,1,0,1,1,0,1,0,1],
// [1,0,1,0,0,0,0,1,0,1],
// [1,0,1,1,1,1,1,1,0,1],
// [1,0,0,0,0,0,0,0,0,1],
// [1,1,1,1,1,1,1,1,1,1]]
//
