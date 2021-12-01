//
//  FirstBadVersion.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/1.
//

import Foundation

class FirstBadVersion{

    func firstBadVersion(_ n: Int) -> Int {

        return binaryBad(1, n)
    }

    func binaryBad(_ start: Int, _ end: Int) -> Int {

        let middle = (end - start)/2 + start

        //必有一个错误版本，当缩到一个时返回此结果
        if start == end {
            return middle
        }

        if isBadVersion(middle) {
            return binaryBad(start, middle)//右侧全是bad，注意这里是middle不是middle+1，因为此时middle可能是第一个bad版本，不能跳过它
        } else {
            return binaryBad(middle + 1, end)
        }

    }

    func isBadVersion(_ version: Int) -> Bool{return true}
}
