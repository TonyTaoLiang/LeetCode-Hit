//
//  ReverseWordsinStringIII.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/4.
//

import Foundation

class ReverseWordsinStringIII{


    //1.不是原地解法 根据“ ”隔开，同时创建了新的字符串
    func reverseWords(_ s: String) -> String {

        let array = s.components(separatedBy: " ")
        var res = ""
        for str in array {

            var separatedArray = Array(str)
            var i = 0
            var j = str.count - 1

            while i < j {

                separatedArray.swapAt(i, j)
                i += 1
                j -= 1

            }

            res = res + String(separatedArray[0..<separatedArray.count]) + " "
            
        }

        return String(res.dropLast())
    }

    //原地解法 根据空格的位置控制j的位置
//    func reverseWords2(_ s: String) -> String {
//
//
//    }
}
