//
//  SquaresofaSortedArray.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/2.
//

import Foundation

class SquaresofaSortedArray{

    func sortedSquares(_ nums: [Int]) -> [Int] {

        var res: [Int] = Array(repeating: 0, count: nums.count)
        var forward: Int = 0
        var backward: Int = nums.count - 1
        var index = nums.count - 1


        while forward <= backward {

            if nums[forward] * nums[forward] > nums[backward] * nums[backward] {
//                res.insert(nums[forward] * nums[forward], at: 0)
                res[index] = nums[forward] * nums[forward]
                forward += 1
            } else {
//                res.insert(nums[backward] * nums[backward], at: 0)
                res[index] = nums[backward] * nums[backward]
                backward -= 1
            }

            index -= 1
        }

        return res
    }

}
