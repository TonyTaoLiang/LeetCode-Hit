//
//  MinStack.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/16.
//

import Foundation

//array中不是Int而是元组
class MinStack {

    var array: [(val: Int , min: Int)] = []

    init() {

    }

    func push(_ val: Int) {
        if let last = array.last , last.min < val {
            array.append((val,last.min))
        }else {
            array.append((val,val))
        }
    }

    func pop() {
       let _ = array.popLast()
    }

    func top() -> Int {
        return array.last!.val
    }

    func getMin() -> Int {
        return array.last!.min
    }
}


//栈中一个辅助数组，存储最小值
class MinStack2 {

    var array: [Int] = []
    var minArray: [Int] = []

    init() {

    }

    func push(_ val: Int) {
        array.append(val)
        if minArray.isEmpty || val <= minArray.last!  {
            minArray.append(val)
        }
    }

    func pop() {

        if let last = array.popLast() {

            if let minLast = minArray.last , last == minLast {
                minArray.popLast()
            }

        }
    }

    func top() -> Int {
        return array.last!
    }

    func getMin() -> Int {
        return minArray.last!
    }
}

//自己傻傻的直接实现一个栈。。。。
class MinStack3 {

    var array: [Int] = []

    init() {

    }

    func push(_ val: Int) {
        array.append(val)
    }

    func pop() {
        array.removeLast()
    }

    func top() -> Int {
        return array.last!
    }

    func getMin() -> Int {
        return array.min()!
    }
}

