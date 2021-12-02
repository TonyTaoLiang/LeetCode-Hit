//
//  SearchInsertPosition.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/1.
//

import Foundation

class SearchInsertPosition{

    func searchInsert(_ nums: [Int], _ target: Int) -> Int {

//        var res = nums.count
//        return binaryInsert2(nums, 0, nums.count - 1, target, &res)
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

        //总之自己的这个思路 很绕 边界很难处理 还是使用优化的方法binaryInsert2
        let middle = (end - start) / 2 + start

        if nums[middle] == target{
            return middle
        } else if nums[middle] < target{
            //这里是== 往右不会出现下面的情况
            return start == end ? end + 1 : binaryInsert(nums, middle + 1, end, target)
        } else {
            //注意这里是>= 举例【1，3】0 ，第一次进来 start = 0 end = middle - 1 = -1
            return start >= end ? start : binaryInsert(nums, start, middle - 1, target)
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
            //相等的时候也继续递归，直到锁定这个值
            //类似于变种：查找第一个值等于给定值的元素（顺序数组可能有重复元素）
            return binaryInsert2(nums, start, middle - 1, target, &res)

        } else {
            return binaryInsert2(nums, middle + 1, end, target, &res)
        }

    }

}
