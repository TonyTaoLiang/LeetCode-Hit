//
//  TrappingRain.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/27.
//

import Foundation

class TrappingRain {

    func trap(_ height: [Int]) -> Int {

        if height.count == 0 || height.count == 1 {
            return 0
        }
        //每根柱子存储的雨水由其左侧最高，右侧最高。二者中的较矮者决定。头尾2根柱子无法接水，因为其左/右没有柱子，雨水直接流走
        var water = 0

        //1.动态规划先求出每根柱子左右二侧的最高的值。（不用动态规划每次循环求其左右二侧复杂度高）

        var leftMaxArray = Array(repeating: 0, count: height.count)

        for i in 1..<height.count-1 {

            leftMaxArray[i] = max(leftMaxArray[i-1], height[i-1])

        }

        var rightMaxArray = Array(repeating: 0, count: height.count)

        for i in (1..<height.count-1).reversed() {

            rightMaxArray[i] = max(rightMaxArray[i+1], height[i+1])

        }


        //2.计算每根柱子接的水
        for i in 1..<height.count-1 {

            //取出左右二侧最高柱子中的，较小值
            let min = min(leftMaxArray[i], rightMaxArray[i])

            //如果当前柱子比左右二侧的柱子高，则不可能存储水
            if min <= height[i] {
                continue
            }

            water += min - height[i]
        }

        return water
    }



    //二周目
    func trapII(_ height: [Int]) -> Int {

        if height.count == 0 || height.count == 1 {
            return 0
        }

        var rain = 0

        var leftHeight: [Int] = [Int]()

        for i in 1..<height.count-1 {
            leftHeight[i] = max(leftHeight[i-1], height[i-1])
        }

        var rightHeight: [Int] = [Int]()

        for i in (1..<height.count-1).reversed() {
            rightHeight[i] = max(rightHeight[i+1], height[i+1])
        }

        for i in 1..<height.count-1 {

            let min = min(leftHeight[i], rightHeight[i])

            if min <= height[i] {
                continue
            }

            rain += min - height[i]
        }

        return rain
    }
}
