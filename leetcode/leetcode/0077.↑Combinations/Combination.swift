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
            print("终止\(start)")
            res.append(c)
            return
        }


        // 遍历可能的搜索起点,套娃,进入第二层，再次循环第三层
        //注意剪枝条件规律n-(k-c.count)+1 不需要每次0...n
        //组合不管顺序，这里是从start开始 不是从1开始
        for i in start...n-(k-c.count)+1 {

            // 向路径变量里添加一个数
            c.append(i)
            //下一层 设置的搜索起点要加 1，因为组合数理不允许出现重复的元素
            dfsCombine(n, k, i+1, &c, &res)
            // 重点理解这里：深度优先遍历有回头的过程，因此递归之前做了什么，递归之后需要做相同操作的逆向操作
            // 参考组合树状图：当选择1进入最深时选择了[1,2]退出了，这时候又要选3组成[1,3]，这时候先要把2去掉
            c.removeLast()
        }
    }

}

class CombinationII {

    func combine(_ n: Int, _ k: Int) -> [[Int]] {

        var res: [[Int]] = [[Int]]()
        var temp: [Int] = [Int]()
        reverseCombine(&res, &temp, 1, k, n)
        return res
    }

    func reverseCombine(_ res: inout [[Int]], _ temp: inout [Int], _ deep: Int, _ k: Int, _ n: Int) {

        if temp.count == k {
            res.append(temp)
            return
        }

        //每次从集合中选取元素，可选择的范围随着选择的进行而收缩，调整可选择的范围。就靠deep来记录下一层的起始位置
        //选择下界：每一层都从之前选的元素后面一个开始选（deep = i + 1）

        //减枝：如果for循环选择的起始位置之后的元素个数 已经不足 我们需要的元素个数了，那么就没有必要搜索了。
        //选择上界：搜索起点的上界（集合n中至多要从该起始位置） + 接下来要选择的元素个数 - 1 = n ；接下来要选择的元素个数 = k - path.size()
        for i in deep..<n-(k-temp.count)+1 {

            temp.append(i)
            reverseCombine(&res, &temp, i+1, k, n)
            temp.removeLast()
        }
    }

}
