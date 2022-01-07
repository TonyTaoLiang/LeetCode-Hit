//
//  ValidPalindrome.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/8.
//

import Foundation

class ValidPalindrome {

    //大佬很秀的解法
    func isPalindrome(_ s: String) -> Bool {

        //这个filter妙啊。直接剔除了字母数字意外的字符，取代了自己写的2个while
        let chars: [Character] = Array(s).filter({
            $0.isASCII && ($0.isLetter || $0.isNumber)
        })

        var start = 0
        var end = chars.count - 1

        while end >= start {
            if chars[start].lowercased() != chars[end].lowercased() {
                return false
            } else {
                start += 1
                end -= 1
            }
        }

        return true
    }

    //转成数组OK
    func isPalindrome1(_ s: String) -> Bool {

        let scharts = Array(s)

        var i = 0
        var j = scharts.count - 1

        while i < j {


            while i < j && !scharts[i].isLetter && !scharts[i].isNumber{
                i += 1
            }

            while i < j && !scharts[j].isLetter && !scharts[j].isNumber{
                j -= 1
            }

            if scharts[i].lowercased() != scharts[j].lowercased() {
                return false
            }

            i += 1
            j -= 1
        }
        return true
    }


    //字符串操作就是超时，转成数组就ok
    func isPalindrome2(_ s: String) -> Bool {

        var i = 0
        var j = s.count - 1

        while i < j {


            while i < j && !s[s.index(s.startIndex, offsetBy: i)].isLetter && !s[s.index(s.startIndex, offsetBy: i)].isNumber{
                i += 1
            }

            while i < j && !s[s.index(s.startIndex, offsetBy: j)].isLetter && !s[s.index(s.startIndex, offsetBy: j)].isNumber{
                j -= 1
            }

            if s[s.index(s.startIndex, offsetBy: i)].lowercased() != s[s.index(s.startIndex, offsetBy: j)].lowercased() {
                return false
            }

            i += 1
            j -= 1
        }
        return true
    }

    //这个方法之间用API：isLetter  isNumber代替
    private func isValid(_ character: Character) -> Bool {

        if (character <= "z" &&  character >= "a") || (character <= "9" &&  character >= "0"){
            return true
        }

        return false
    }



}
