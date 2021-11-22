//
//  LongestPalindromicSubstring.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/7/14.
//

import Foundation

class LongestPalindromicSubstring {


    func longestPalindrome(_ s: String) -> String {

        var res = ""

        //转成数组，方便下面操作字符串的下标
//        let sCharts = Array(s)

        //二维数组超时 ，优化一下类似于最长公共子串，用一维数组倒着遍历j。如果顺着遍历就会覆盖下一层
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)

        for i in 0..<s.count {
            dp[i][i] = true
        }

        //i倒着遍历是因为dp[i,j] = dp[i+1,j-1]推导而来。联想二维数组i+1是i的下一层，所以从后往前遍历
        for i in (0...s.count-1).reversed() {
            //j的范围为什么是从i～len。这是因为回文串的表示是s[i,j],j肯定是在i的右边
            //例如"abba" :  第一次遍历(a,a)，第二次遍历 (b,b)（ba）.随着i一直往左走，j的判断范围就越大。回文串就越来越长，最终将所有的情况都遍历到。实际上填写二维数组格子的范围应该是对角线的右半边。
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

        //优化一下,类似于最长公共子串，用一维数组倒着遍历j。如果顺着遍历就会覆盖下一层
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

    //中心扩散（中心分长度为1 or 2，奇 or 偶）
    func longestPalindrome4(_ s: String) -> String {

        guard s.count > 1 else {
            return s
        }

        let sCharts = Array(s)
        var start: Int = 0 , maxLen: Int = 0

        for i in 0..<s.count {

            maxPalindrome(sCharts, i, i, &start, &maxLen)
            maxPalindrome(sCharts, i, i+1, &start, &maxLen)
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
