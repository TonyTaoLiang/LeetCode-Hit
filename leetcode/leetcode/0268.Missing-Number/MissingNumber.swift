//
//  MissingNumber.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/12.
//

import Foundation

class MissingNumber {


    //异或
    func missingNumber(_ nums: [Int]) -> Int {

        var res = 0

        for i in 0..<nums.count {
            res ^= nums[i]
        }
        //相当于扩充数组，元素都出现了2次，除了消失的那个数字只出现一次
        for i in 0...nums.count {
            res ^= i
        }


        return res
    }

    //自己的做法是题解第四个做法：数学 高斯求和
    func missingNumber2(_ nums: [Int]) -> Int {

        var res = 0

        for i in 0..<nums.count {
            res += nums[i]
        }

        let full = nums.count*(nums.count+1)/2

        return full - res
    }

}
