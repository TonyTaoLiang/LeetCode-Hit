//
//  0167.TwoSumInputArray.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/3.
//

import Foundation

class TwoSumInputArray{

    //解法一：双指针
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

        var i: Int = 1, j: Int = numbers.count

        while i < j {

            if numbers[i-1] + numbers[j-1] < target {

                i += 1

            } else if numbers[i-1] + numbers[j-1] > target{

                j -= 1

            } else {
                return [i,j]
            }
        }

        return []

    }

    //解法二：二分，先固定一个元素，然后二分查找另外一个
    func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {

        for i in 0..<numbers.count {

            var low = i + 1
            var high = numbers.count - 1

            while low <= high {

                let middle = (high - low)/2 + low

                if numbers[middle] == target - numbers[i] {
                    return [i+1,middle+1]
                } else if numbers[middle] > target - numbers[i]{
                    high = middle - 1
                } else {
                    low = middle + 1
                }

            }

        }

        return []
    }

}
