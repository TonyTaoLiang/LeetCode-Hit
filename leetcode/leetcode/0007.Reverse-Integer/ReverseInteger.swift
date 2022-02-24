//
//  ReverseInteger.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/23.
//

import Foundation

class ReverseInteger {

    //第一反应是转字符串，后面才想到取模
    func reverse(_ x: Int) -> Int {

        var x = x
        var temp = 0

        while x != 0 {

            temp = temp*10 + x%10
            x = x/10
        }
        //左移，判断int32的范围
        if temp > 1 << 31 - 1 || temp < -(1 << 31) {
            return 0
        }

        return temp
        
        //return ret >= Int32.max || ret <= Int32.min ? 0 : ret

    }

}
