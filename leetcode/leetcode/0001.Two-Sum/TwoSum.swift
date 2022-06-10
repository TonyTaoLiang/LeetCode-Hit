//
//  TwoSum.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/7/12.
//

import Foundation

class TwoSum {

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var dict: [Int : Int] = [:]

        for (i, num) in nums.enumerated() {

            if let index = dict[target - num] {

                return [index, i]

            }

            dict[num] = i

        }

        fatalError("No match num")
    }


    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {

        var dict: [Int : Int] = [Int : Int]()


        for i in 0..<nums.count {

            if (dict[target - nums[i]] != nil) {

                return [i,dict[target - nums[i]]!]

            }

            dict[nums[i]] = i
        }

        fatalError("No match num")

    }
}
