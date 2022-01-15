//
//  ImplementstrStr.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/15.
//

import Foundation

class ImplementstrStr {


    //567 很像 滑动窗口 双指针
    //双指针
    /**
     直观的解法的是：枚举原串 ss 中的每个字符作为「发起点」，每次从原串的「发起点」和匹配串的「首位」开始尝试匹配：

     匹配成功：返回本次匹配的原串「发起点」。
     匹配失败：枚举原串的下一个「发起点」，重新尝试匹配。
     */
    func strStr2(_ haystack: String, _ needle: String) -> Int {

        if needle.count == 0 {
            return 0
        }

        if needle.count > haystack.count {
            return -1
        }

        let haystackArray = Array(haystack)
        let needleArray = Array(needle)

        for i in 0...haystackArray.count - needleArray.count {

            var j = i

            //这句优化到i的循环范围 0...haystackArray.count - needleArray.count
//            if haystackArray.count - i < needleArray.count{
//                return -1
//            }

            for k in 0..<needleArray.count {

                if haystackArray[j] == needleArray[k] {
                    if j - i == needleArray.count - 1 {
                        return i
                    }
                    j += 1
                }else {
                    break
                }
            }
        }

        return -1
    }

    //滑动窗口(但是超出时间限制了啊。。。)
    func strStr(_ haystack: String, _ needle: String) -> Int {

        if needle.count == 0 {
            return 0
        }

        if needle.count > haystack.count {
            return -1
        }

        let haystackArray = Array(haystack)
        let needleArray = Array(needle)
        var tempArray = haystackArray[0..<needleArray.count - 1]

        if tempArray.elementsEqual(needleArray) {
            return 0
        }

        for i in needleArray.count-1..<haystackArray.count {

            tempArray = haystackArray[(i - needleArray.count + 1)...i]

            if tempArray.elementsEqual(needleArray) {
                return i - needleArray.count + 1
            }
        }

        return -1
    }

}
