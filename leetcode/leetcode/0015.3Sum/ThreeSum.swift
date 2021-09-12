//
//  ThreeSum.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/9/12.
//

import Foundation

class ThreeSum {

    func threeSum(_ nums: [Int]) -> [[Int]] {

        //这种初始化结果会多出一个空的元素[]
//        var res: [[Int]] = [[]]

        var res = [[Int]]()

        guard nums.count >= 3 else {
            return res
        }

        //对数组进行排序
        let nums = nums.sorted()

        //开始选择一个元素
        for i in 0..<nums.count - 2 {

            //为了避免重复如果当前元素已经选择过，则跳过
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }

            let firstNum = nums[i], remainSum = -firstNum

            var m = i + 1, n = nums.count - 1

            while m < n {

                if nums[m] + nums[n] == remainSum {

                    res.append([nums[i],nums[m],nums[n]])

                    //避免重复跳过
                    repeat {
                        m += 1
                    } while nums[m] == nums[m-1] && m < n

                    repeat {
                        n -= 1
                    } while nums[n] == nums[n+1] && m < n

                } else if nums[m] + nums[n] < remainSum{
                    //因为数组已经排序，此时是左边的太小
                    m += 1
                } else {
                    n -= 1
                }


            }

        }

        return res
    }
}
