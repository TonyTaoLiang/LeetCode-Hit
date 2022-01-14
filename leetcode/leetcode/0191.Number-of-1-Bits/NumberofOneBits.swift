//
//  NumberofOneBits.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/14.
//

import Foundation

class NumberofOneBits {

    //解法一:n是32位，所以循环 & 1 << i(1...32) 判断即可

    //解法二:`X = X & ( X -1 )` 这个操作可以清除最低位的二进制位 1，利用这个操作，直至把数清零。操作了几次即为有几个二进制位 1
    //时间复杂度O(logn)。循环次数等于 n 的二进制位中 1 的个数，最坏情况下 n 的二进制位全部为 1。我们需要循环logn次。（求一个数的二进制位数就是不断右移直至为0,右移不就是除2）
    /**
     计算二进制位数
     int BitLength(unsigned int n)
     {
     return n ? BitLength1(n / 2 ) + 1 : 0 ;
     }
     运算次数，log(n)，至多32次
     */
    func hammingWeight(_ n: Int) -> Int {

        var res = 0
        var n = n

        while n != 0 {

            n &= (n-1)

            res += 1
        }

        return res
    }


}
