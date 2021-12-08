//
//  PermutationinString.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/6.
//

import Foundation

class PermutationinString {

    //解法一：滑动窗口
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


    //解法二：双指针
    func checkInclusion2(_ s1: String, _ s2: String) -> Bool {

        if s1.count > s2.count {
            return false
        }

        var array1 = Array(repeating: 0, count: 26)
        let a: Character = "a"
        let num2 = Array(s2)
        var left = 0
        //统计s1中每个字符的个数
        for character in s1 {

            array1[Int(character.asciiValue!) - Int(a.asciiValue!)] -= 1

        }

        for right in 0..<s2.count {

            //计算右侧入区间字符的个数
            array1[Int(num2[right].asciiValue!) - Int(a.asciiValue!)] += 1

            //此字符出现次数过多，左指针右移,左区间的字符次数-1
            while array1[Int(num2[right].asciiValue!) - Int(a.asciiValue!)] > 0 {
                array1[Int(num2[left].asciiValue!) - Int(a.asciiValue!)] -= 1
                left += 1
            }

            if right - left + 1 == s1.count {
                return true
            }
        }

        return false
    }
}
