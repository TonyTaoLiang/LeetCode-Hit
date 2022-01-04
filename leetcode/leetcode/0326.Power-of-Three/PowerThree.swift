//
//  PowerThree.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/4.
//

import Foundation

class PowerThree {

    //解法一：试除
    func isPowerOfThree(_ n: Int) -> Bool {

        var n = n
        while n != 0 && n % 3 == 0 {
            n = n/3
        }

        return n == 1

    }

    //解法二：找约数
    //在题目给定的 32 位有符号整数的范围内，最大的 3 的幂为 3^{19} = 11622614673

    //我们只需要判断 n 是否是 3^{19}的约数即可。
    //注意：这并不是快速判断 x 的幂的通用做法，当且仅当 x 为质数可用。
    func isPowerOfThree2(_ n: Int) -> Bool {
        return n > 0 && Int(pow(3.0, 19.0)) % n == 0

    }

    //解法三：打表（把所有范围内3的幂都算出来存起来，然后查表）

    //预处理出不超过 int 数据范围的所有 3 的幂，这样我们在跑测试样例时，就不需要使用「循环/递归」来实现逻辑，可直接 O(1)查表返回。

    let set: Set<Int> = {

        var cur = 1
        var temp = Set<Int>()
        temp.insert(cur)

        while cur <= Int.max / 3 {

            cur *= 3
            temp.insert(cur)
        }

        return temp
    }()

    func isPowerOfThree3(_ n: Int) -> Bool {

        return n > 0 && self.set.contains(n)

    }
}
