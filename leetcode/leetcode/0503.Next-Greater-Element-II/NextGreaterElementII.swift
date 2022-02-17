//
//  NextGreaterElementII.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/17.
//

import Foundation

class NextGreaterElementII {

    //单调栈：正着来
    //如何实现循环数组：数组扩充一倍，取模
    func nextGreaterElements(_ nums: [Int]) -> [Int] {

        //先初始化为-1
        var res = Array(repeating: -1, count: nums.count)

        //单调栈存下标
        var stack = Stack<Int>()

        let n = nums.count

        //循环数组，扩充到2倍
        for i in 0..<n*2 {

            //当前元素n比栈顶元素m大，则顶出m，顶出的元素m的右侧最大值则是当前元素n
            while !stack.isEmpty && nums[i % n] > nums[stack.peek()!] {

                //顶出栈顶
                let index = stack.pop()!
                //顶出的右侧最大值为当前元素
                res[index] = nums[i % n]

            }

            //当前下标入栈
            stack.push(i % n)

        }

        return res
    }

    //和496一样的解法，倒着来
    func nextGreaterElements2(_ nums: [Int]) -> [Int] {
        var stack : [Int] = []
        var ret = nums
        let n = nums.count
        var i = 2 * n - 1
        while i >= 0 {
            let e = nums[i % n]
            while !stack.isEmpty && stack.last! <= e {
                stack.removeLast()
            }
            ret[i % n] = stack.isEmpty ?  -1 : stack.last!
            stack.append(e)
            i -= 1
        }
        return ret
    }
}



