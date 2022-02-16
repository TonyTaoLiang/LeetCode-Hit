//
//  NextGreaterElement.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/16.
//

import Foundation

class NextGreaterElement {

    //解法一：暴力法
    func nextGreaterElement1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        var res = [Int]()

        for i in 0..<nums1.count {

            let index = nums2.firstIndex(of: nums1[i])

            for j in index!..<nums2.count {

                if nums2[j] > nums1[i] {
                    res.append(nums2[j])
                    break
                }

                if j == nums2.count - 1 {
                    res.append(-1)
                }

            }

        }

        return res
    }

    //解法二：单调栈
    //单调栈实际上就是栈，只是利用了一些巧妙的逻辑，使得每次新元素入栈后，栈内的元素都保持有序（单调递增或递减）
    //当题目出现「找到最近一个比其大的元素」的字眼时，自然会想到「单调栈」。具体readme

    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        //使用单调栈，倒序处理nums2
        var stack = Stack<Int>()
        //map记录每个元素右侧第一个最大的值（此值在栈中）
        var map: [Int:Int] = [:]

        for i in (0..<nums2.count).reversed() {

            //矮个子就出去
            while !stack.isEmpty && stack.peek()! <= nums2[i] {
                stack.pop()
            }

            //记录当前元素右侧第一个最大值
            map[nums2[i]] = stack.isEmpty ? -1 : stack.peek()!

            //当前元素进栈，参加高矮比对
            stack.push(nums2[i])

        }


        var res = [Int]()
        //开始比对子集nums1
        for i in 0..<nums1.count {
            res.append(map[nums1[i]]!)
        }

        return res
    }

}
