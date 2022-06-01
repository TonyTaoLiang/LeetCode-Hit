//
//  RotateArray.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/2.
//

import Foundation

class RotateArray{

    //这个连续反转三次的做法真是太妙了
    //数组翻转的时候 就采用了头尾指针（双指针）
    func rotate(_ nums: inout [Int], _ k: Int) {

        let move = k % nums.count
        reverseArray(&nums, 0, nums.count - 1)
        reverseArray(&nums, 0, move - 1)
        reverseArray(&nums, move, nums.count - 1)

    }

    func reverseArray(_ nums: inout [Int], _ start: Int, _ end: Int) {

        var start = start
        var end = end

        while start < end {

            let temp = nums[end]
            nums[end] = nums[start]
            nums[start] = temp
            start += 1
            end -= 1

        }

    }


    func rotate2(_ nums: inout [Int], _ k: Int) {

        let move = k % nums.count
        _rotate(&nums, 0, nums.count - 1)
        _rotate(&nums, 0, move - 1)
        _rotate(&nums, move, nums.count - 1)
    }

    func _rotate(_ nums: inout [Int], _ start: Int, _ end: Int) {

        var start = start
        var end = end

        while start < end {

            let temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1

        }

    }


}
