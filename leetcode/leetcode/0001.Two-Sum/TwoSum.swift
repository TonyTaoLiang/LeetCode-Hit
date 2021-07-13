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
}
