//
//  UniqueNumber.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/11.
//

import Foundation

class UniqueNumber {

    //100%
    func uniqueOccurrences(_ arr: [Int]) -> Bool {

        var dict: [Int : Int] = [:]

        for num in arr {

//            if dict[num] != nil {
//                dict[num]! += 1
//            }else {
//                dict[num] = 1
//            }

            dict[num] = (dict[num] ?? 0) + 1

        }

        //用set去重
        let set = Set(dict.values)

        return set.count == dict.values.count
    }

}
