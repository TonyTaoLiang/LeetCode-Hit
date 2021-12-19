//
//  GenerateParentheses.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/19.
//

import Foundation

class GenerateParentheses{

    func generateParenthesis(_ n: Int) -> [String] {

        if n == 0 {
            return []
        }

        var characters: [Character] = Array(repeating: " ", count: n << 1)
        var res = [String]()

        dfsParenthesis(0, n, n, &characters, &res)
        return res

    }


    private func dfsParenthesis(_ index: Int, _ leftRemain: Int, _ rightRemain: Int, _ characters: inout [Character], _ res: inout [String]){

        if index == characters.count {
            res.append(String(characters))
            return
        }

        //每一层有2个选择 要么左 要么右
        //左括号还有剩余就能选
        if leftRemain > 0 {
            //因为每次是覆盖了当前位置的值，不是append所以回溯时不用做相反操作
            characters[index] = "("
            //下一层
            dfsParenthesis(index+1, leftRemain-1, rightRemain, &characters, &res)
        }

        //右括号的剩下的比左括号多才能选右括号
        if rightRemain > 0 && leftRemain < rightRemain {
            characters[index] = ")"
            dfsParenthesis(index+1, leftRemain, rightRemain-1, &characters, &res)
        }

    }

}
