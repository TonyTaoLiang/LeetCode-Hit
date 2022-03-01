//
//  DailyTemperatures.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/28.
//

import Foundation

class DailyTemperatures {

    //单调栈
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {

        var stack = Stack<Int>()

        var res = Array(repeating: 0, count: temperatures.count)

        var i = temperatures.count - 1

        while i >= 0 {

            while !stack.isEmpty && temperatures[i] >= temperatures[stack.peek()!] {

                stack.pop()

            }

            if let top = stack.peek() {
                res[i] = top - i
            }

            stack.push(i)

            i -= 1
        }

        return res
    }

    enum MyError: Error {
        case Mem
        case SS(String)
    }

    class func divide(_ first: Int) throws -> Int {

        if first == 0 {
            throw MyError.Mem
        }else if first == 2 {
            throw MyError.SS("xxxx")
        }

        return first

    }

    func tt() {

        do {
            try DailyTemperatures.divide(1)
        } catch MyError.Mem  {
            print("")
        } catch is MyError{
            print("xx")
        } catch let MyError.SS(some){
            print(some)
        } catch {

        }

    }
}
