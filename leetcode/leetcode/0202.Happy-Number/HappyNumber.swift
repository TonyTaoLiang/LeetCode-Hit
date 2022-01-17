//
//  HappyNumber.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/17.
//

import Foundation

class HappyNumber {

    //此题主要是1.为什么不会无限大的分析 2.时间空间复杂度的分析
    func getNext(_ n: Int) -> Int {

        var res = 0
        var remain = n

        while remain > 0 {

            let digital = remain % 10
            res += digital * digital
            remain = remain / 10

        }

        return res

    }

    //解法一：用HashMap存储判断
    func isHappy(_ n: Int) -> Bool {

        var map: Set<Int> = Set()
        var num = n

        while num != 1 && !map.contains(num) {

            map.insert(num)
            num = getNext(num)

        }

        return num == 1
    }

    //解法二：快慢指针 找环
    func isHappy2(_ n: Int) -> Bool {

        var slow = n
        var fast = getNext(n)

        while fast != 1 && fast != slow {

            slow = getNext(slow)
            fast = getNext(getNext(fast))

        }

        return fast == 1
    }
}
