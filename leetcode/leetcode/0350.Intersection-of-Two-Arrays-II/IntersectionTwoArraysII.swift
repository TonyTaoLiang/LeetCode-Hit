//
//  IntersectionTwoArraysII.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/25.
//

import Foundation

class IntersectionTwoArraysII {


    //自己想的是2个字典分别遍历2个数组，key是元素，value是出现次数。然后比较2个字典
    //其实一个字典就够了，因为是以少的为主，那么存在一个加一个即可。
    //PS：排序后，然后双指针也行
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        var dict: [Int : Int] = [Int : Int]()
        var res = [Int]()

        for num1 in nums1 {

            guard let count = dict[num1] else {
                dict[num1] = 1
                continue

            }

            dict[num1] = count + 1

        }

        for num2 in nums2 {

            guard let count = dict[num2] else {
                continue
            }

            if count > 0 {
                dict[num2] = count - 1
                res.append(num2)
            }

        }

        return res
    }

    //优化一下，可以用 ？？
    class Solution {
        func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            //降低哈希表占用的内存空间
            // let mixArray = nums1.count > nums2.count ? nums2 : nums1
            //临时比较不知道后面较大的去那个数组来遍历
            if nums1.count > nums2.count { //递归调用
                return intersect(nums2, nums1)
            }

            var dict = Dictionary<Int, Int>()
            for item in nums1 {
                 dict[item] = (dict[item] ?? 0) + 1
            }

            var result = [Int]()
            for item in nums2 {
                if  (dict[item] ?? 0) > 0 {
                    result.append(item)
                    dict[item] = (dict[item] ?? 0) - 1
                }
            }

            return result
        }
    }

}
