//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/6.
//

import Foundation

class LongestSubstringWithoutRepeatingCharacters{

    func lengthOfLongestSubstring(_ s: String) -> Int {

        var maxLength = 0, startIndex = 0, charactersDict = [Character: Int]()

        let array = Array(s)

        for (i, num) in array.enumerated() {

            if let pos = charactersDict[num] {

                //找到重复了的元素 左窗口滑动 重复的字符移出了左边界
                startIndex = max(startIndex, pos)

            }

            //右边界继续右移（i+1是考虑了边界 当元素只有一个时，结果是1。）
            charactersDict[num] = i + 1
            //每次记录下当前的长度
            maxLength = max(maxLength, i - startIndex + 1)

        }

        return maxLength
    }

}
