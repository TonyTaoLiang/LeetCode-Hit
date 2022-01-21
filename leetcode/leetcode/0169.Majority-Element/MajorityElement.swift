//
//  MajorityElement.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/21.
//

import Foundation

class MajorityElement {


    //排序: 数组中间的元素总是“多数元素/众数”(排序想到了，中间元素没想到，想到的是指针在遍历一次数组)
    /*
     时间复杂度：O(n\log n)O(nlogn)。将数组排序的时间复杂度为 O(n\log n)O(nlogn)。

     空间复杂度：O(\log n)O(logn)。如果使用语言自带的排序算法，需要使用 O(\log n)O(logn) 的栈空间。如果自己编写堆排序，则只需要使用 O(1)O(1) 的额外空间。
    */
    func majorityElement1(_ nums: [Int]) -> Int {

        return nums.sorted()[nums.count/2]
    }


    //摩尔投票 O(n)  O(1) 摩尔投票算法是基于这个事实：每次从序列里选择两个不相同的数字删除掉（或称为“抵消”），最后剩下一个数字或几个相同的数字，就是出现次数大于总数一半的那个
    func majorityElement(_ nums: [Int]) -> Int {

        var candidate = nums[0]//没能被抵消的数
        var count = 1//没能被抵消的数的个数

        for i in 1..<nums.count {

            if count == 0 {
                candidate = nums[i]
                count += 1
            } else {

                if nums[i] == candidate{
                    count += 1
                } else {
                    count -= 1
                }

            }

        }

        return candidate
    }
}
