//
//  SlidingWindowMaximum.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/3/5.
//

import Foundation

class SlidingWindowMaximum {

    //使用双端队列
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

        //用一个数组来表示双端队列，头尾都能进出。Use an array to store indices of elements, from larger to smaller,adjust it while iterating the array
        //保存当前窗口最大值的数组位置 保证队列中数组位置对应的数值按从大到小排序
        var maxIdx: [Int] = [Int]()
        var res: [Int] = [Int]()

        for i in 0..<nums.count {

            //遍历到当前元素比队列尾部的大，则队列尾部出列， 保证队列的顺序总是从大到小，对列头部总是最大的
            while maxIdx.count > 0 && nums[maxIdx.last!] <= nums[i] {
                maxIdx.removeLast()
            }

            //当前元素入列
            maxIdx.append(i)

            //窗口开始满了，滑动起来
            if i >= k - 1 {

                //队列头部最大的值，滑出了窗口，不在窗口里面了。则队列头部元素出列
                if maxIdx.first! + k == i {
                    maxIdx.removeFirst()
                }

                //每次将当前窗口的最大值，加入最后的结果
                res.append(nums[maxIdx.first!])

            }

        }

        return res
    }
}

class SlidingWindowMaximumII {

    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

        var maxIdx = [Int]()
        var res = [Int]()

        for i in 0..<nums.count {

            while maxIdx.count > 0 && nums[maxIdx.last!] <= nums[i] {
                maxIdx.removeLast()
            }

            maxIdx.append(i)

            if i >= k - 1 {

                if maxIdx.first! == i - k {
                    maxIdx.removeFirst()
                }

                res.append(nums[maxIdx.first!])
            }
        }
        return res
    }

}

class SlidingWindowMaximumIII {

    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

        var maxID: [Int] = [Int]()
        var res: [Int] = [Int]()

        for i in 0..<nums.count {

            while maxID.count > 0 && nums[maxID.last!] <= nums[i] {
                maxID.removeLast()
            }

            maxID.append(i)

            if i >= k-1 {

                if maxID.first! == i - k{
                    maxID.removeFirst()
                }

                res.append(nums[maxID.first!])
            }

        }

        return res
    }
}
