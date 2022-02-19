//
//  FindDuplicateNumber.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/18.
//

import Foundation

class FindDuplicateNumber {

    //第一反应是：排序，双指针，二分。

    //快慢指针：数组元素映射成下标。如果存在重复元素，则说明有环。
    
    func findDuplicate(_ nums: [Int]) -> Int {

        //不能像龟兔一样初始化（乌龟在起点，兔子在root的后面）
        //因为为了找环入口时，需要都从起始点出发（才能得到如图f=b）
        //        var slow = 0
        //        var fast = nums[0]

        var slow = 0
        var fast = 0
        //        slow = nums[slow]
        //        fast = nums[nums[fast]]
        //        //循环直到快指针追上慢指针
        //        while slow != fast {
        //            slow = nums[slow]
        //            fast = nums[nums[fast]]
        //        }

        //循环直到快指针追上慢指针，需要至少执行一次循环体，否则直接用 while 循环会导致无法进入循环体
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while fast != slow

        //追上后，找环入口
        var pre = 0 //快指针重新从0出发
        var behind = slow //慢指针不动
        //分别一步一步走，相遇即为环入口
        while pre != behind {
            pre = nums[pre]
            behind = nums[behind]
        }

        return pre
    }

    //二分法 
}
