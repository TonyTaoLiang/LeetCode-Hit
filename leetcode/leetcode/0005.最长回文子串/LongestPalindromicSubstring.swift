//
//  LongestPalindromicSubstring.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/7/14.
//

import Foundation

class LongestPalindromicSubstring {

    //解法一：DP
    func longestPalindrome(_ s: String) -> String {

        var res = ""

        //转成数组，方便下面操作字符串的下标
//        let sCharts = Array(s)

        //二维数组
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)

        for i in 0..<s.count {
            dp[i][i] = true
        }

        //i倒着遍历是因为dp[i,j] = dp[i+1,j-1]推导而来。也就是需要先算出左下角的值
        //联想二维数组的表i+1是i的下一层，所以从后往前遍历
        for i in (0...s.count-1).reversed() {
            //j的范围为什么是从i～len。这是因为回文串的表示是s[i,j],j肯定是在i的右边
            //例如"abba" :  第一次遍历(a,a)，第二次遍历 (b,b)（ba）.随着i一直往左走，j的判断范围就越大。回文串就越来越长，最终将所有的情况都遍历到。实际上填写二维数组格子的范围应该是对角线的右半边。（因为j始终比i大）
            for j in i..<s.count {
                //j-1 < 3是字符串长度为0，1，2 几种特殊情况只需要判断头尾是否相等
                dp[i][j] = s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: j)] && ((j-i < 3) || dp[i+1][j-1])

                //每次保存下当前最长的串
                if dp[i][j] && (res == "" || j - i + 1 > res.count) {
                    //操作下标
                    res = String(s[i..<j+1])
                }
            }

        }
        return res
    }


    //优化空间复杂度O(n^2)->O(n)
    func longestPalindrome2(_ s: String) -> String {

        var res = ""

        //转成数组，方便下面操作字符串的下标
//        let sCharts = Array(s)

        //优化一下,用一维数组倒着遍历j。如果顺着遍历j-1的值就会重新计算，覆盖掉应该获取的左下角（也就是下一层的值 如求1-4 就得先知道2-3的值）
        var dp = Array(repeating: false, count: s.count)

        for i in (0...s.count-1).reversed() {

            for j in (i..<s.count).reversed() {
                //j-1 < 3是字符串长度为0，1，2 几种特殊情况只需要判断头尾是否相等
                dp[j] = s[i] == s[j] && ((j-i < 3) || dp[j-1])

                //每次保存下当前最长的串
                if dp[j] && j - i + 1 > res.count {
                    //操作下标
                    res = String(s[i..<j+1])
                }
            }

        }
        return res
    }

    //直接操作String会超时不过，而转换成cString就可以了
    func longestPalindrome3(_ s: String) -> String {

        let cs = s.cString(using: .ascii)!
        let n = strlen(cs)
        var rng: (first: Int, second: Int) = (0, 0)
        //优化一下,类似于最长公共子串，用一维数组倒着遍历j。如果顺着遍历就会覆盖下一层
        var dp = Array(repeating: false, count: s.count)

        for i in (0...n-1).reversed() {

            for j in (i..<n).reversed() {
                //j-1 < 3是字符串长度为0，1，2 几种特殊情况只需要判断头尾是否相等
                dp[j] = cs[i] == cs[j] && ((j-i < 3) || dp[j-1])

                //每次保存下当前最长的串
                if dp[j] && j - i + 1 > rng.second - rng.first {
                    //操作下标
                    rng = (i,j+1)
//                    res = String(s[i..<j+1])
                }
            }

        }
        return String(cString: cs[rng.0...rng.1].map{$0} + [0])
    }

    //解法二：中心扩散（中心分长度为1 or 2，奇 or 偶）
    func longestPalindrome4(_ s: String) -> String {

        guard s.count > 1 else {
            return s
        }

        let sCharts = Array(s)
        var start: Int = 0 , maxLen: Int = 0

        //枚举每个轴心的位置
        for i in 0..<s.count {
            //然后做两次假设
            maxPalindrome(sCharts, i, i, &start, &maxLen)//奇
            maxPalindrome(sCharts, i, i+1, &start, &maxLen)//偶
        }

        return String(sCharts[start..<start+maxLen])
    }

    func maxPalindrome(_ sCharts: [Character], _ i: Int, _ j: Int, _ start: inout Int, _ maxLen: inout Int) {

        var i = i, j = j

        while i >= 0 && j < sCharts.count && sCharts[i] == sCharts[j]{

            i -= 1
            j += 1
        }

        if j - i - 1 > maxLen {
            start = i + 1
            maxLen = j - i - 1
        }

    }

    //解法三：中心扩散的优化（滑动窗口，双指针）
    //核心思路：（可看图）
    //        0.以一串连续的相同字符组成的子串作为扩展中心。
    //        1.选择一个字符s[i]，right指针一直跳到第一个与s[i]不相等的位置，s[i]的左侧位置计为left。然后选择[left,right]这一坨（可能是多个字符，可能是一个字符）作为扩展中心。
    //        2.找到最长回文子串后，right作为下一次的i。即不在一个一个的挪动，直接跳过上一次相等字符。你一个个的挪动，绝对没有相等那一坨[left,right]扩展中心的长。
    //        3.为啥不用考虑间隙作为中心了？思考，选择间隙也是没有相等的一坨[left,right]作为扩展中心的长
    //        4.这样就跳过了许多扩展中心
    /**
     func longestPalindrome1(s string) string {
         if len(s) == 0 {
             return ""
         }
         left, right, pl, pr := 0, -1, 0, 0
         for left < len(s) {
             // 移动到相同字母的最右边（如果有相同字母）
             for right+1 < len(s) && s[left] == s[right+1] {
                 right++
             }
             // 找到回文的边界
             for left-1 >= 0 && right+1 < len(s) && s[left-1] == s[right+1] {
                 left--
                 right++
             }
             if right-left > pr-pl {
                 pl, pr = left, right
             }
             // 重置到下一次寻找回文的中心
             left = (left+right)/2 + 1
             right = left
         }
         return s[pl : pr+1]
     }

     */
}
public extension String {
  subscript(value: Int) -> Character {
    self[index(at: value)]
  }
}

public extension String {
  subscript(value: NSRange) -> Substring {
    self[value.lowerBound..<value.upperBound]
  }
}

public extension String {
  subscript(value: CountableClosedRange<Int>) -> Substring {
    self[index(at: value.lowerBound)...index(at: value.upperBound)]
  }

  subscript(value: CountableRange<Int>) -> Substring {
    self[index(at: value.lowerBound)..<index(at: value.upperBound)]
  }

  subscript(value: PartialRangeUpTo<Int>) -> Substring {
    self[..<index(at: value.upperBound)]
  }

  subscript(value: PartialRangeThrough<Int>) -> Substring {
    self[...index(at: value.upperBound)]
  }

  subscript(value: PartialRangeFrom<Int>) -> Substring {
    self[index(at: value.lowerBound)...]
  }
}

private extension String {
  func index(at offset: Int) -> String.Index {
    index(startIndex, offsetBy: offset)
  }
}
