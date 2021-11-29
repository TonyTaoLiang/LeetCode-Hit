//
//  MergeSortedArray.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/11/29.
//

import Foundation

class MergeSortedArray {

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        var p1 = m - 1
        var p2 = n - 1
        var cur = 0
        var tail = m + n - 1

//        [1,2,3,0,0,0]
//        [2,5,6]
        while p1 >= 0 || p2 >= 0 {

            if p1 == -1 {
                cur = nums2[p2]
                p2 -= 1
            } else if p2 == -1 {
                cur = nums1[p1]
                p1 -= 1
            } else if nums1[p1] > nums2[p2] {

                cur = nums1[p1]
                p1 -= 1
            } else {
                cur = nums2[p2]
                p2 -= 1
            }

            //m + n - 1   -  (m - p1 -1  +  n - p2 - 1)
            //这样不对 p1 = -1 p2 = -1 时越界
            //nums1[p1 + p2 + 1] = cur
            nums1[tail] = cur
            tail -= 1
        }

    }


}
