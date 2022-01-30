//
//  Sqrt.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/29.
//

import Foundation

class Sqrts {

    //解法一：二分法
    func mySqrt(_ x: Int) -> Int {

        return binarySearch(0, x, x)

    }

    private func binarySearch(_ start: Int, _ end: Int, _ x: Int) -> Int {

        if start == end {
            return start
        }

        //这个middle取值也关键，向上取
//        let middle = (end + start + 1)/2
        let middle = (end - start)/2 + start + 1
        if middle*middle > x {
            return binarySearch(start, middle-1, x)
        } else if middle*middle < x{

            return binarySearch(middle, end, x)
            //左边界不要+1.因为 < x 的值可能是答案，+1 则可能跳过（例如[0...8]）
            //因为答案要求小数部分忽略
            //但是middle的值要注意往大了取，不然这里死循环
//            return binarySearch(middle + 1, end, x)
        } else {
            return middle
        }

    }

    //解法一：二分优化
    func mySqrt1(_ x: Int) -> Int {

        var l = 0
        var r = x

        while l < r {

            let middle = (r - l)/2 + l + 1

            if middle*middle > x {
                r = middle - 1
            } else if middle*middle <= x {
                l = middle
            }

        }

        return l
    }

    //解法二：牛顿迭代法
    //涉及到求导（斜率/坡度）导数入门：https://www.shuxuele.com/calculus/derivatives-introduction.html
    /**
     这种算法的原理很简单，我们仅仅是不断用 (x,f(x)) 的切线来逼近方程 x^2-a=0的根。根号a 实际上就是 x^2-a=0的一个正实根，这个函数（是一个抛物线）的导数是 2x。也就是说，函数上任一点 (x,f(x)) 处的切线斜率是 2x。那么，x−f(x)/(2x) 这个值就是切线与x轴的交点。这个值就是一个比 x 更接近的近似值。代入 f(x)=x^2-a得到 x-(x^2-a)/(2x)，也就是 (x+a/x)/2。

     */
    /*
     x^2=a, f(x)=x^2 - a

     当为x的时候，f(x)对应的点会有一条切线，这条切线的斜率为2x （ 对x^2求导，得到的2x 即为该点切线的斜率 ）

     那么这条切线与x轴的交点是多少 （已知斜率为2x,高为f(x)）

     交点的横坐标为 x - ( f(x) ÷ 2x )

     那么以这个交点为值代入公式进行平方，为什么会更接近 a 呢？

     参照方程(x^2)的图像，当x大于√a时，任意一个点（x , f(x)）,它的切线与x轴的交点为（横坐标 ， 0） 该横坐标即为上述所求

     这个交点横坐标是大于√a且小于x的，所以此时 [ x - ( f(x) ÷ 2x ) ]^2 比 x^2 更接近a
     */

    func mySqrt2(_ x: Int) -> Int {

        var r = x

        while r*r > x {

            r = (r + x/r)/2

        }

        return r
    }


}
