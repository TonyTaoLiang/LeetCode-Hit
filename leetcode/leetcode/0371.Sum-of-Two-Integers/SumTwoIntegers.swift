//
//  SumTwoIntegers.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/5.
//

import Foundation

class SumTwoIntegers {

    /**
     1.a + b 的问题拆分为 (a 和 b 的无进位结果) + (a 和 b 的进位结果)
     2.无进位加法使用异或运算计算得出
     3.进位结果使用与运算和移位运算计算得出
     4.循环此过程，直到进位为 0 //循环是因为进位+不进位结果可能又进位

     */
    func getSum(_ a: Int, _ b: Int) -> Int {

        var a = a
        var b = b

        while b != 0 {

            //计算进位
            let carry = (a & b) << 1
            //计算不进位结果
            a = a ^ b
            //进位给b后面还要跟不进位的结果求和，知道不进位为止
            b = carry

        }

        return a
    }
}
