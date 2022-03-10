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

        var mutableGrid = grid

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

        //为什么不像BFS打印树的节点这样直接循环dequeue然后enqueue，一开始不能理解题解这句话，原因在于这样第一层入列和第二层入列的全混合在一起，无法计算round了。
        //这个队列中第 1 层和第 2 层的结点会紧挨在一起，无法区分
        //while let locate = queue.dequeue() {

        //}

        // 如果有新鲜橘子 并且 队列不为空
        // 直到上下左右都触及边界 或者 被感染的橘子已经遍历完
        while count > 0 && !queue.isEmpty {

            //每次进入都是新的一层
            round += 1

            for _ in 0..<queue.size {

                let locate: (Int,Int)? = queue.dequeue()

                //当前腐烂的坐标
                if let r = locate?.0, let c = locate?.1 {

                    // ↑ 上邻点 判断是否边界 并且 上方是否是健康的橘子
                    if r - 1 >= 0 && mutableGrid[r-1][c] == 1{

                        //感染它
                        mutableGrid[r-1][c] = 2
                        //好橘子-1
                        count -= 1
                        //入列
                        queue.enqueue((r-1,c))

                    }
                    // ↓ 下邻点 同上
                    if r + 1 < grid.count && mutableGrid[r+1][c] == 1{

                        //感染它
                        mutableGrid[r+1][c] = 2
                        //好橘子-1
                        count -= 1
                        //入列
                        queue.enqueue((r+1,c))

                    }
                    // ← 左邻点 同上
                    if c - 1 >= 0 && mutableGrid[r][c-1] == 1{

                        //感染它
                        mutableGrid[r][c-1] = 2
                        //好橘子-1
                        count -= 1
                        //入列
                        queue.enqueue((r,c-1))

                    }
                    // → 右邻点 同上
                    if c + 1 < grid[0].count && mutableGrid[r][c+1] == 1{

                        //感染它
                        mutableGrid[r][c+1] = 2
                        //好橘子-1
                        count -= 1
                        //入列
                        queue.enqueue((r,c+1))

                    }

                }

            }

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

//腐烂的橘子二周目
class RottingOrangesII {

    func orangesRotting(_ grid: [[Int]]) -> Int {
//0 空 1新鲜 2腐烂

        var grids = grid

        var fresh = 0

        var queue = QueueArray<(Int,Int)>()

        for i in 0..<grid.count {

            for j in 0..<grid[i].count {

                if grid[i][j] == 1 {
                    fresh += 1
                } else if grid[i][j] == 2{
                    queue.enqueue((i,j))
                }

            }
        }

        var round = 0

        while fresh > 0 && !queue.isEmpty {

            round += 1

            //第一层，所有橘子开始感染，算一分钟。依次类推
            for _ in 0..<queue.size {

                let location = queue.dequeue()
                let x = location!.0
                let y = location!.1
                //上
                if x - 1 >= 0 && grids[x-1][y] == 1 {

                    grids[x-1][y] = 2
                    fresh -= 1
                    queue.enqueue((x-1,y))
                }
                //左
                if y - 1 >= 0 && grids[x][y-1] == 1 {

                    grids[x][y-1] = 2
                    fresh -= 1
                    queue.enqueue((x,y-1))
                }
                //下
                if x + 1 < grids.count && grids[x+1][y] == 1 {

                    grids[x+1][y] = 2
                    fresh -= 1
                    queue.enqueue((x+1,y))
                }
                //右
                if y + 1 < grids[0].count && grids[x][y+1] == 1 {

                    grids[x][y+1] = 2
                    fresh -= 1
                    queue.enqueue((x,y+1))
                }


            }


        }

        return fresh == 0 ? round : -1
    }

}
