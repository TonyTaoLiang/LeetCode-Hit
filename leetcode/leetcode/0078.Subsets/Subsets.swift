//
//  Subsets.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/3.
//

import Foundation

class Subsets {

    //跟77题：组合可以说是一样了 使用回溯
    func subsets(_ nums: [Int]) -> [[Int]] {

        //这种初始化初始就有一个空元素[]
        var res: [[Int]] = [[]]

        var tempArray = [Int]()

        for i in 1...nums.count {
            backTrace(i, 0, &res, nums, &tempArray)
        }

        return res
    }


    func backTrace(_ count: Int, _ deep: Int, _ res: inout [[Int]], _ nums: [Int], _ tempArray: inout [Int]) {

        if tempArray.count == count {
            res.append(tempArray)
            return
        }

        //这个边界 不好找
        //搜索起点的上界（顶多选到这个下标） + 接下来要选择的元素个数 - 1 = n
        //例如3选2.[1,2,3]顶多选到元素2
        //接下来要选择的元素个数 = count-tempArray.count
        //搜索起点的上界 = n - (k - path.size()) + 1
        for i in deep...nums.count-(count-tempArray.count) {
            tempArray.append(nums[i])
//            backTrace(count, deep+1, &res, nums, &tempArray)
            //注意是i+1，表示下一层开始查找的下标start
            backTrace(count, i+1, &res, nums, &tempArray)
            tempArray.removeLast()
        }

    }
}
