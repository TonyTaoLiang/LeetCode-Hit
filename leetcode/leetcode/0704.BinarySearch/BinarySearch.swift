//
//  BinarySearch.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/1.
//

import Foundation

public class BinarySearch{

    //1.递归
    func search(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums, 0, nums.count - 1, target)

    }

    func binarySearch(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {

        if start > end {
            return -1
        }

        let middle = (end - start) / 2 + start

        if nums[middle] == target{
            return middle
        } else if nums[middle] > target{
            return binarySearch(nums, start, middle - 1, target)
        } else{
            return binarySearch(nums, middle + 1, end, target)
        }

    }

    //2.常规遍历，空间复杂度要小一点
    func search2(_ nums: [Int], _ target: Int) -> Int {

        var start = 0
        var end = nums.count - 1

        while start <= end {
            let middle = (end - start) / 2 + start

            if nums[middle] == target{
                return middle
            } else if nums[middle] > target{
                end = middle - 1
            } else{
                start = middle + 1
            }
        }

        return -1
    }
}
