//
//  ReverseBits.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/19.
//

import Foundation

class ReverseBits {

    func reverseBits(_ n: Int) -> Int {

        var res = 0

        for i in 0..<32 {

           res |= ((n >> i) & 1) << (31 - i)
           //+= 也行
           //res += ((n >> i) & 1) << (31 - i)
        }

        return res
    }

    //解法二：分治法，看图，有点优秀
    func reverseBits2(_ n: Int) -> Int {

        //交换第一半
        var res = (n >> 16) | (n << 16)
        //依次二分调换
        res = ((n & 0xff00ff00) >> 8) | ((n & 0x00ff00ff) << 8)
        res = ((n & 0xf0f0f0f0) >> 4) | ((n & 0x0f0f0f0f) << 4)
        res = ((n & 0xcccccccc) >> 2) | ((n & 0x33333333) << 2)
        res = ((n & 0xaaaaaaaa) >> 1) | ((n & 0x55555555) << 1)

        return res 
    }
}
