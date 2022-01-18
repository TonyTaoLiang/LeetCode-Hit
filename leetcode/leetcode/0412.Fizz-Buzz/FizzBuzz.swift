//
//  FizzBuzz.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/18.
//

import Foundation

class FizzBuzz {

    func fizzBuzz(_ n: Int) -> [String] {

        var res: [String] = [String]()

        for i in 1...n {

            var str = ""

            if i % 3 == 0 {
                str += "Fizz"
            }

            if i % 5 == 0 {
                str += "Buzz"
            }

            if str == "" {
                str = String(i)
            }

            res.append(str)
        }

        return res
    }

}
