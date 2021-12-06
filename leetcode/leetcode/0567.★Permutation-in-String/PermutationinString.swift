//
//  PermutationinString.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/6.
//

import Foundation

class PermutationinString {


    func checkInclusion(_ s1: String, _ s2: String) -> Bool {


        if s1.count > s2.count {
            return false
        }

        //1.滑动窗口
        //26个小写字母 记录每个字符出现的次数
        var array1 = Array(repeating: 0, count: 26)
        var array2 = Array(repeating: 0, count: 26)

        let num1 = Array(s1)
        let num2 = Array(s2)
        let a: Character = "a"

        //窗口扩充到s1的长度
        for i in 0..<s1.count {

            array1[Int(num1[i].asciiValue!) - Int(a.asciiValue!)] += 1
            array2[Int(num2[i].asciiValue!) - Int(a.asciiValue!)] += 1
        }

        if array1.elementsEqual(array2) {
            return true
        }


        for i in s1.count..<s2.count {
            //开始滑动窗口 右边进入的+1 ，左边出去的-1
            array2[Int(num2[i].asciiValue!) - Int(a.asciiValue!)] += 1
            array2[Int(num2[i - s1.count].asciiValue!) - Int(a.asciiValue!)] -= 1
            if array1.elementsEqual(array2) {
                return true
            }

        }

        return false
    }

}
