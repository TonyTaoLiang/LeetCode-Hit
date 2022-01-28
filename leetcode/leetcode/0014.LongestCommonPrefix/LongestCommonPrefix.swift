//
//  LongestCommonPrefix.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/28.
//

import Foundation

class LongestCommonPrefix {

    //纵向扫描
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

}
