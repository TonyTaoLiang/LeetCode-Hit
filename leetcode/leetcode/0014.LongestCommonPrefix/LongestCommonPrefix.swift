//
//  LongestCommonPrefix.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/28.
//

import Foundation

class LongestCommonPrefix {

    //纵向扫描：时间复杂度很高
    func longestCommonPrefix(_ strs: [String]) -> String {

        if strs.count == 0 {
            return ""
        }

        //取出第一个元素作为参照，一一比对每个下标的字符
        for i in 0..<strs[0].count {

            let char = Array(strs[0])[i]
            //依次比对数组中的元素
            for j in 1..<strs.count {

                if i == strs[j].count || Array(strs[j])[i] != char {

                    return String(Array(strs[0])[0..<i])
                }

            }

        }

        return strs[0]
    }

    //纵向二：时间复杂度较上述方法好
    func longestCommonPrefix2(_ strs: [String]) -> String {

        if strs.count == 0 {
            return ""
        }

        var head = strs[0]

        for char in strs {

            while !char.hasPrefix(head) {

                if head.count == 0 {
                    return ""
                }

                //每次同一个元素比较就缩小head，下次比较head就短，时间复杂度好
                let index = head.index(head.startIndex, offsetBy: head.count-1)

                head = head.substring(to: index)
            }
        }

        return head

    }
}
