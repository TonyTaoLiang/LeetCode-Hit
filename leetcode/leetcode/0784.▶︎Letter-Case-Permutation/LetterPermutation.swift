//
//  LetterPermutation.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/14.
//

import Foundation
class LetterPermutation{

    /**
     自上而下
||             abc
||        /           \
||      abc           Abc
||    /    \         /    \
||  abc    aBc     Abc    ABc
|| /  \    /  \    / \     / \
||abc abC aBc aBC Abc AbC ABc ABC
vv  ....

     char c = '字母'
     c ^= (1 << 5)
     可以不用知道字母 c 的大小写的情况，做大小写切换。
     */
    func letterCasePermutation(_ s: String) -> [String] {

        if s.count == 0 {
            return []
        }
        var res: [String] = [String]()
        var ss = String(s)
        dfsLetterPermutation(&ss, 0, &res)
        return res
    }

    func dfsLetterPermutation(_ s: inout String, _ depth: Int, _ res: inout [String]){

        //depth到最后一层了
        if s.count == depth {
            res.append(s)
            return
        }

        //就把它当成一颗二叉树，left，right就是大，小写。遇到数字（没有左右分支了）回溯去上一层不做处理，继续下去
        //当每走到一个“路口”时面临的选择只有三个(其实只有2个)：
        //大写
        //小写
        //数字 “死路”不用去试
        //那在对字符做遍历时，每遇到一个字母，就分出2个分支出来分别再往下遍历。

        if s[depth].isNumber {
            return dfsLetterPermutation(&s, depth + 1, &res)
        }
        //当前分支
        dfsLetterPermutation(&s, depth + 1, &res)
        //改变大小写->另外一个分支
        let currentInt = Int(s[depth].asciiValue!) ^ (1 << 5)
        // 把ASCII码值转换为字符
        let currentCharacter = Character(UnicodeScalar(currentInt)!)
        //这句有问题：如果字符串有相同的字符，替换会乱掉，要替换对应位置的字符
        //s = s.replacingOccurrences(of: String(s[depth]), with: String(currentCharacter))
        let index = s.index(s.startIndex, offsetBy: depth)
        s = s.replacingCharacters(in: index...index, with: String(currentCharacter))
        dfsLetterPermutation(&s, depth + 1, &res)
    }

}


//高手100%
class Solutionss {
    func letterCasePermutation(_ s: String) -> [String] {
        var results = [String]()
        if s.count == 0 { return results }
        var chars = Array(s)
        helper(&results, &chars, 0)
        return results
    }

    private func helper(_ results: inout [String], _ chars: inout [Character], _ curIndex: Int) {
        let N = chars.count
        if curIndex == N {
            results.append(String(chars))
            return
        }
        if chars[curIndex] >= Character("0") && chars[curIndex] <= Character("9") { // 非字母直接跳过
            helper(&results, &chars, curIndex + 1)
            return
        }

        chars[curIndex] = Character(chars[curIndex].lowercased()) // 当前字符转变成小写
        helper(&results, &chars, curIndex + 1)

        chars[curIndex] = Character(chars[curIndex].uppercased()) // 当前字符转变成大写
        helper(&results, &chars, curIndex + 1)

    }

}
