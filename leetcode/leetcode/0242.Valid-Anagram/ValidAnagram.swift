//
//  ValidAnagram.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/22.
//

import Foundation

class ValidAnagram {

    //第一反应是类似567题字符串的排列：创建一个26字符的数组，打表。滑动窗口都不用
    func isAnagram(_ s: String, _ t: String) -> Bool {

        if s.count != t.count {
            return false
        }

        var sChart = Array(repeating: 0, count: 26)
        var cChart = Array(repeating: 0, count: 26)

        for character in s {

            let index = character.asciiValue! - Character("a").asciiValue!
            sChart[Int(index)] += 1
        }

        for character in t {
            let index = character.asciiValue! - Character("a").asciiValue!
            cChart[Int(index)] += 1
        }

        if !sChart.elementsEqual(cChart) {
            return false
        }

        return true
    }


    //进阶: 如果输入字符串包含 unicode 字符怎么办？ 使用unicodeScalars
    //对于进阶问题，Unicode 是为了解决传统字符编码的局限性而产生的方案，它为每个语言中的字符规定了一个唯一的二进制编码。而 Unicode 中可能存在一个字符对应多个字节的问题，为了让计算机知道多少字节表示一个字符，面向传输的编码方式的 UTF−8 和UTF−16 也随之诞生逐渐广泛使用

    func isAnagram2(_ s: String, _ t: String) -> Bool {

        if s.count != t.count {
            return false
        }

        var sChart = Array(repeating: 0, count: 26)
        var cChart = Array(repeating: 0, count: 26)

        for character in s.unicodeScalars {

            let index = character.value - Character("a").unicodeScalars.first!.value
            sChart[Int(index)] += 1
        }

        for character in t.unicodeScalars {
            let index = character.value - Character("a").unicodeScalars.first!.value
            cChart[Int(index)] += 1
        }

        if !sChart.elementsEqual(cChart) {
            return false
        }

        return true
    }

}
