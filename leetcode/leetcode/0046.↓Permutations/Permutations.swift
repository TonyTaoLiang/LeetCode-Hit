//
//  Permutations.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/13.
//

import Foundation
class Permutations{

    func permute(_ nums: [Int]) -> [[Int]] {

        var res: [[Int]] = [[Int]]()
        var c: [Int] = [Int]()
        //标志此元素有没有选
        var used: [Bool] = Array(repeating: false, count: nums.count)
        bfsPermute(nums, 0, &c, &res, &used)
        return res
    }


    func bfsPermute(_ nums: [Int], _ index: Int, _ c: inout [Int], _ res: inout [[Int]], _ used: inout [Bool]) {

        //选满了则退出
//        if c.count == nums.count {
//            res.append(c)
//            return
//        }
        //这判断也行 为什么？？
        if index == nums.count {
            res.append(c)
            return
        }
        //index表示当前程序递归到第几层
        //因为最开始index = 0 是从0开始的

        /**
                      [] bfsPermute(nums, 0, &c, &res, &used) 0层

        [1]           [2]         [3]    1层

         从第0层开始调用for i in 0..<nums.count i = 0 此时是从1开始的一直深度遍历，当1开头的结束后。此时bfsPermute(nums, 0, &c, &res, &used)这个函数还没有调用完，index 还是 == 0 ，但是for i in 0..<nums.count i = 0 此时 i == 1 即第一层选择2，从2开始。
         因此从2开头深度遍历，最后index+++++1 最后也是index == nums.count

.....
         */

        
        //每次都是从所有的里面选
        for i in 0..<nums.count {

            //此次此元素没有被选
            if !used[i] {
                used[i] = true
                c.append(nums[i])
                bfsPermute(nums, index + 1, &c, &res, &used)
                c.removeLast()
                used[i] = false
            }

        }
    }

}
