//
//  RomantoInteger.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/23.
//

import Foundation

class RomantoInteger {

    //题解是部分打表，一言蔽之，把一个小值放在大值的左边，就是做减法，否则为加法
    //但是考虑IXL，2种特殊组合一起怎么搞？结果是不存在这样的罗马数字,也就是不存在连续2个左边小的
    //s should be a valid roman integer
    func romanToInt(_ s: String) -> Int {

        let chart:[Character : Int] = [

            "I" : 1,
            "V" : 5,
            "X" : 10,
            "L" : 50,
            "C" : 100,
            "D" : 500,
            "M" : 1000

        ]

        var res = 0
        //哨兵 虚拟最前一个元素
        var candidate = 0

        for character in s {

            if chart[character]! > candidate {

                res -= candidate

            }else {

                res += candidate
            }

            candidate = chart[character]!
        }

        res += candidate

        return res
    }




    //自己思路：全部打表
    func romanToInt1(_ s: String) -> Int {

        let chart:[String : Int] = [

            "I" : 1,
            "V" : 5,
            "X" : 10,
            "L" : 50,
            "C" : 100,
            "D" : 500,
            "M" : 1000,
            "IV" : 4,
            "IX" : 9,
            "XL" : 40,
            "XC" : 90,
            "CD" : 400,
            "CM" : 900

        ]

        var res = 0
        let arrays = Array(s)
        var i = 0

        while i < arrays.count {

            if i + 1 < arrays.count && chart[String(arrays[i...i+1])] != nil{

                res += chart[String(arrays[i...i+1])]!
                i = i+2
                continue

            }

            res += chart[String(arrays[i])]!

            i += 1
        }

        return res
    }
}
