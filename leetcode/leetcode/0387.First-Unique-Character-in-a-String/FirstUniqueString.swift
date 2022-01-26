//
//  FirstUniqueString.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/26.
//

import Foundation

class FirstUniqueString {

    //方法一：26的数组存的是下标，麻烦一点 92%，28%（数组改用字典也行）
    func firstUniqChar(_ s: String) -> Int {

        let array = Array(s)
        var letters = Array(repeating: -2, count: 26)
        var res = Int.max

        for i in 0..<array.count {

            let index = Int(array[i].asciiValue!) - Int(Character("a").asciiValue!)

            letters[index] = letters[index] == -2 ? i : -1

        }

        for value in letters {

            if value >= 0 {
                res = min(res, value)
            }

        }

        return res == Int.max ? -1 : res
    }


    //方法二：26的数组存次数,简单点。但87.42%，22.64%（数组改用字典也行）
    func firstUniqChar2(_ s: String) -> Int {

        let array = Array(s)
        var letters = Array(repeating: 0, count: 26)

        for i in 0..<array.count {

            let index = Int(array[i].asciiValue!) - Int(Character("a").asciiValue!)

            letters[index] += 1

        }

        for i in 0..<array.count {

            let index = Int(array[i].asciiValue!) - Int(Character("a").asciiValue!)

            if letters[index] == 1 {
                return i
            }

        }

        return -1
    }


    //方法三：拓展 hash + 队列。次数为一则如入列，多次则出列，最后队首则为结果，队列为空则-1

}
