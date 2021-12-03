//
//  MoveZeroes.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/3.
//

import Foundation

class ModeZeroes{

    func moveZeroes(_ nums: inout [Int]) {

        var i = 0
        var j = 0

        while i < nums.count {

            if nums[i] == 0 {
                i += 1
            } else {
                nums.swapAt(i, j)
                i += 1
                j += 1
            }

        }

    }

}
