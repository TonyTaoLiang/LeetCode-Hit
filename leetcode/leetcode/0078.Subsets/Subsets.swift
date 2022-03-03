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

class SubsetsII {

    //跟77题：组合可以说是一样了 使用回溯
    func subsets(_ nums: [Int]) -> [[Int]] {

        var res: [[Int]] = [[Int]]()
        var temp = [Int]()

        for i in 0...nums.count {

            deepSearch(&res, &temp, 0, i, nums)

        }
        print("子集\(res)")
        return res
    }

    func deepSearch(_ res: inout [[Int]], _ temp: inout [Int], _ start: Int, _ k: Int, _ nums: [Int]) {

        if temp.count == k {
            res.append(temp)
            return
        }

        for i in start...nums.count-(k - temp.count) {

            temp.append(nums[i])
            deepSearch(&res, &temp, i+1, k, nums)
            temp.removeLast()
        }

    }

}
