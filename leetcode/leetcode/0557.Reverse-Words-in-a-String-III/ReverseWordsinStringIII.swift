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

    //原地解法(也不原地，swift直接交换字符串太麻烦了，这里还是转成了array，但是超时了，了解这个思路就行了吧。用上面一个方法即可) 根据空格的位置控制i的位置
    func reverseWords2(_ s: String) -> String {

        var i = 0
        var array = Array(s)

        while i < s.count {

            var start = i

            while i < s.count && s[s.index(s.startIndex, offsetBy: i)] != " " {
                i += 1
            }

            var end = i - 1

            while start < end {

                array.swapAt(start, end)
                start += 1
                end -= 1

            }

            while i < s.count && s[s.index(s.startIndex, offsetBy: i)] == " " {
                i += 1
            }
        }

        return String(array[0..<array.count])
    }
}
