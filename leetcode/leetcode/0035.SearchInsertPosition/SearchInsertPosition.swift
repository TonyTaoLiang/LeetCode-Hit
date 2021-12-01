//
//  SearchInsertPosition.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/1.
//

import Foundation

class SearchInsertPosition{

    func searchInsert(_ nums: [Int], _ target: Int) -> Int {

        var res = nums.count
        return binaryInsert2(nums, 0, nums.count - 1, target, &res)
        return binaryInsert(nums, 0, nums.count - 1, target)
    }

    func binaryInsert(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {

        //以下判断可以合并到下面去
//        if start == end {
//            //当最后只有一个元素时，比较target和当前元素的大小
//            if nums[end] == target{
//                return end
//            } else if nums[end] < target{
//                return end + 1
//            } else {
//                return end - 1 < 0 ? 0 : end - 1
//            }
//        }

        let middle = (end - start) / 2 + start

        if nums[middle] == target{
            return middle
        } else if nums[middle] < target{
            return start == end ? end + 1 : binaryInsert(nums, middle + 1, end, target)
        } else {
            return start == end ? (end - 1 < 0 ? 0 : end - 1) : binaryInsert(nums, start, middle - 1, target)
        }
    }

    //再优化一下：即不断用二分法逼近查找第一个大于等于target的下标
    func binaryInsert2(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int , _ res: inout Int) -> Int {

        if start > end {
            return res
        }

        let middle = (end - start) / 2 + start
        //初始值是n。如果全部比他小那么就插在最后

        if target <= nums[middle]{
            res = middle
            return binaryInsert2(nums, start, middle - 1, target, &res)

        } else {
            return binaryInsert2(nums, middle + 1, end, target, &res)
        }

    }

}
