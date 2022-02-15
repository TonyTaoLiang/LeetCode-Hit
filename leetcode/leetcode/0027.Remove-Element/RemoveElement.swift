//
//  RemoveElement.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/15.
//

import Foundation

class RemoveElement {

    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {

        if nums.count == 0 {
            return 0
        }

        var i = 0
        var j = nums.count - 1

        while i <= j {

            if nums[i] == val {
                nums.swapAt(i, j)
            }

            while i < nums.count && nums[i] != val {
                i += 1
            }

            while j >= i && nums[j] == val{
                j -= 1
            }

        }

        return i
    }

}
