//
//  FindDuplicates.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/7/13.
//

import Foundation

class FindDuplicates {

    func findDuplicates(_ nums: [Int]) -> [Int] {

        var result: [Int] = []
        var array = nums

        for num in array {

            let index = abs(num)

            if array[index-1] < 0 {
                result.append(index)
            } else {
                array[index-1] = -array[index-1]
            }
        }

        return result

    }

}
