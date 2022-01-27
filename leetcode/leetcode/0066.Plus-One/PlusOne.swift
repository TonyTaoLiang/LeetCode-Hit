//
//  PlusOne.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/27.
//

import Foundation

class PlusOne {

    func plusOne(_ digits: [Int]) -> [Int] {

        var res = digits

        for i in (0..<res.count).reversed() {

            if res[i] + 1 < 10 {
                res[i] = res[i] + 1
                break
            }

            res[i] = (res[i] + 1) % 10

            if i == 0 {
                res.insert(1, at: 0)
            }
        }


        return res
    }

}
