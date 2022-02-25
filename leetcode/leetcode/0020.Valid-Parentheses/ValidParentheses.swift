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
        let parentheses: [Character : Character] = [

            "}" : "{",
            ")" : "(",
            "]" : "["
        ]

        var stack: Stack<Character> = Stack()

        for sCharts in s {

            //左括号入栈
            if sCharts == "[" || sCharts == "(" || sCharts == "{"{
                stack.push(sCharts)
            } else {

                //没有左括号与之匹配 || 栈顶的左与右不匹配（后遇到的左括号先没有闭合）
//                if stack.isEmpty || stack.peek()! != parentheses[sCharts]{
//                    return false
//                }
//
//                stack.pop()

                //更简单的做法
                if parentheses[sCharts] != stack.pop() {
                    return false
                }
            }

        }

        return stack.isEmpty
    }

    //OneMoreTime
    func isValid2(_ s: String) -> Bool {

        if s.count % 2 == 1 {
            return false
        }

        var stack = Stack<Character>()

        let map: [Character : Character] = [

            "]" : "[",
            "}" : "{",
            ")" : "("
        ]

        for scharacter in s {

            if scharacter == "{" || scharacter == "[" || scharacter == "("{

                stack.push(scharacter)

            } else {

                if map[scharacter] != stack.pop() {
                    return false
                }

            }

        }

        return stack.isEmpty
    }

}
