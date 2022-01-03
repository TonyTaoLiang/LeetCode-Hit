//
//  Powxn.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/3.
//

import Foundation

class Powxn {

    //快速幂(分治 递归) ： 3^20 = 3^10 * 3 ^10
    func myPow(_ x: Double, _ n: Int) -> Double {

        if n == 0 {
            return 1.0
        }

        if n == -1 {
            return 1/x
        }

        //判断奇偶
        let neg = n & 1

        var half = myPow(x, n >> 1) //如果是-1 算数右移一位还是 -1 （补码），-1 单独处理

        half *= half

        return neg == 0 ? half : half * x //为什么始终是x，当n为负数时不是乘以1/x，因为前面 n==-1时单独计算了。（用n=-3 模拟一下此情况）

    }


    //快速幂(迭代) 看图
    func myPow2(_ x: Double, _ n: Int) -> Double {

        var res = 1.0
        var x = x
        //n是负数 也先转成正数(用long ，-2^31 <= n <= 2^31-1 , 如果是-2^31 用int转正数会溢出)
        var y: Int64 = n < 0 ? -Int64(n) : Int64(n)

        while y > 0 {

            //当前二进制位是1 则添加进最终结果
            if y & 1  == 1{
                res = res * x
            }

            //每次自己乘以自己
            x *= x

            //右移一位
            y = y >> 1
        }
        //如果为负则取倒数
        return n > 0 ? res : 1/res
    }


    //n很大直接栈溢出
    func myPow3(_ x: Double, _ n: Int) -> Double {

        if n == 0 {
            return 1.0
        }

        if n > 0 {

            return x * myPow(x, n - 1)

        } else {

            return 1/x * myPow(x, n + 1)
        }

    }

}
