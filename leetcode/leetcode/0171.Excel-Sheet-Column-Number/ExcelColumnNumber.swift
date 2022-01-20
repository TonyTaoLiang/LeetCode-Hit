//
//  ExcelColumnNumber.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/20.
//

import Foundation

class ExcelColumnNumber {

    //就是26进制，参照2进制的转换直接写
    //“FXSHRXW” 23 * 26^0 + 24 * 26^1 + 18 * 26^2 + 8 * 26^3 + 19 * 26^4 + 24 * 26^5 + 6 * 26^6 = 2147483647
    func titleToNumber1(_ columnTitle: String) -> Int {

        var res = 0
        let columnArray = Array(columnTitle)
        let A: Character = "A"

        for i in 0..<columnArray.count {

            let val = columnArray[i].asciiValue! - A.asciiValue! + 1

            res += NSDecimalNumber(decimal: pow(Decimal(26), columnArray.count - i - 1)).intValue * Int(val)

        }

        return res
    }


    //100%优秀做法：转一道弯
    //从左往右遍历的话，后面多一位就相当于原来的数左移了一位，所以乘26，多的那位数相当于在个位的数，所以直接加就行

    /**
     例如BBB: 括号里面就是res

     第一步    B: 2
     第二步   BB: (2*26) + 2
     第三步  BBB: ((2*26) + 2)*26 + 2 = 2*26*26 + 2*26 + 2
     */

    func titleToNumber(_ columnTitle: String) -> Int {

        var res = 0

        //for in 要比 forEach 速度快一倍！！！！
        for character in columnTitle {

            let val = character.asciiValue! - Character("A").asciiValue! + 1

            res = res*26 + Int(val)


        }
//        columnTitle.forEach { character in
//
//            let val = character.asciiValue! - Character("A").asciiValue! + 1
//
//            res = res*26 + Int(val)
//        }

        return res
    }
}
