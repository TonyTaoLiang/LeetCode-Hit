//
//  RemoveDuplicatesSortedArray.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/13.
//

import Foundation

class RemoveDuplicatesSortedArray {

    //思路跟题解一样 双指针
    func removeDuplicates(_ nums: inout [Int]) -> Int {

        if nums.count == 0 {
            return 0
        }

        var i = 0
        var j = 0

        while j < nums.count {

            if nums[i] != nums[j] {
                i += 1
                nums.swapAt(i, j)
            }

            j += 1
        }

        return i + 1

    }

}
