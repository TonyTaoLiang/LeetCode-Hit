//
//  Combination.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/13.
//

import Foundation

class Combination{

    func combine(_ n: Int, _ k: Int) -> [[Int]] {

        if n <= 0 || k <= 0 || k > n {
            return [[]]
        }

        var res: [[Int]] = [[Int]]()
        var c: [Int] = [Int]()

        dfsCombine(n, k, 1, &c, &res)

        return res

    }

    private func dfsCombine(_ n: Int, _ k: Int, _ start: Int, _ c: inout [Int], _ res: inout [[Int]]){

        // 递归终止条件是：path 的长度等于 k
        if c.count == k {
            res.append(c)
            return
        }


        // 遍历可能的搜索起点,套娃,进入第二层，再次循环第三层
        //注意剪枝条件规律n-(k-c.count)+1 不需要每次0...n
        //组合不管顺序，这里是从start开始 不是从1开始
        for i in start...n-(k-c.count)+1 {

            // 向路径变量里添加一个数
            c.append(i)
            //下一层
            dfsCombine(n, k, i+1, &c, &res)
            // 重点理解这里：深度优先遍历有回头的过程，因此递归之前做了什么，递归之后需要做相同操作的逆向操作
            // 参考组合树状图：当选择1进入最深时选择了[1,2]退出了，这时候又要选3组成[1,3]，这时候先要把2去掉
            c.removeLast()
        }
    }

}
