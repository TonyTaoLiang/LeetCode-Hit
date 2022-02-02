//
//  MostWater.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/1.
//

import Foundation

class MostWater {

    //开始想的是暴力法，枚举所有的2根柱子，O(n^2)
    //对撞指针正解：先选取最长的宽度，l,r指针矮的移动。
    //优化方向：下一个l比之前的l更短（下一个r比之前的r更短）直接跳过
    func maxArea(_ height: [Int]) -> Int {

        var l = 0
        var r = height.count - 1
        var res = 0

        while l < r {

            //左边柱子更矮
            if height[l] <= height[r] {

                let minH = height[l]
                res = max(res, (r-l)*minH)
                //下一个l比之前的l更短不断跳过
                while l < r && height[l] <= minH {
                    l += 1
                }

            } else {

                let minH = height[r]
                res = max(res, (r-l)*minH)
                //下一个l比之前的l更短不断跳过
                while l < r && height[r] <= minH {
                    r -= 1
                }

            }

        }

        return res
    }

}
