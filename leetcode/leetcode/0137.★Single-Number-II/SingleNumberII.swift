//
//  SingleNumberII.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/11.
//

import Foundation

/*
 对于这道题，可使用异或运算 ⊕。异或运算有以下三个性质。

 任何数和 0 做异或运算，结果仍然是原来的数，即a⊕0=a。
 任何数和其自身做异或运算，结果是 0，即a⊕a=0。
 异或运算满足交换律和结合律，即a⊕b⊕a=b⊕a⊕a=b⊕(a⊕a)=b⊕0=b。

 */
class SingleNumberII {

    func singleNumber(_ nums: [Int]) -> Int {

        var res = 0

        nums.forEach {
            res ^= $0
        }

        return res
    }

}
