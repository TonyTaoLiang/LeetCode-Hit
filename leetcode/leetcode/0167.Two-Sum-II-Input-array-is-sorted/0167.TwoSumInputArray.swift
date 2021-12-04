//
//  0167.TwoSumInputArray.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/3.
//

import Foundation

class TwoSumInputArray{

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
}
