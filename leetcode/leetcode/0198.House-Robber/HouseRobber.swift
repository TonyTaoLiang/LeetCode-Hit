//
//  HouseRobber.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/15.
//

import Foundation

class HouseRobber {

    func rob(_ nums: [Int]) -> Int {

        if nums.count == 1 {
            return nums.first!
        }

        var resArray: [Int] = Array(repeating: 0, count: nums.count + 1)
        //初始化下第一个元素
        resArray[1] = nums[0]
        for i in 2...nums.count {

            resArray[i] = max(resArray[i-1], resArray[i-2] + nums[i-1])

        }

        return resArray.last!

    }

    //这个解法二 时间空间在leetcode上和解法一差不多，还不好理解，建议以解法一为主
    // 解法二 DP 优化辅助空间，把迭代的值保存在 2 个变量中
    func rob2(_ nums: [Int]) -> Int {

        var preMax = 0 //之前最大值
        var currentMax = 0 //记住当前最大值

        for i in 0..<nums.count {

            let temp = currentMax
            currentMax = max(currentMax, nums[i] + preMax)
            preMax = temp
        }

        return currentMax
    }
}
