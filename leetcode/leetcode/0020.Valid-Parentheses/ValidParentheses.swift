//
//  ValidParentheses.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/7.
//

import Foundation

class ValidParentheses {

    //用栈啊！后遇到的左括号要先闭合，因此我们可以将这个左括号放入栈顶

    func isValid(_ s: String) -> Bool {

        //奇数
        if s.count % 2 == 1 {
            return false
        }

        //用hash快速匹配
        let parentheses = [

            "}" : "{",
            ")" : "(",
            "]" : "["
        ]

        var stack: Stack<Character> = Stack()

        let sCharts = Array(s)

        for i in 0..<sCharts.count {

            if sCharts[i] == "[" || sCharts[i] == "(" || sCharts[i] == "{"{
                stack.push(sCharts[i])
            } else {

                if stack.isEmpty {
                    return false
                }


            }

        }


        return stack.isEmpty
    }

}
