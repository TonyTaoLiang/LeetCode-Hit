//
//  ContainsDuplicate.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/24.
//

import Foundation

class ContainsDuplicate {
    //1.字典  2.排序比对连续元素
    //就简单用个set吧 虽然复杂度高一点
    func containsDuplicate(_ nums: [Int]) -> Bool {

        let map: Set<Int> = Set(nums)
        return map.count != nums.count

    }

}
