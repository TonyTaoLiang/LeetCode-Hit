//
//  LinkedListCycle.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/9.
//

import Foundation

class LinkedListCycle {

    func hasCycle(_ head: ListNode?) -> Bool {

        if head == nil || head?.next == nil{
            return false
        }

        var slow = head
        var fast = head?.next
        //假设一个虚拟节点，先跑第一步，fast则在slow的next。若都初始化为head，while循环不走。用do while则可都设置为head
        while slow !== fast {

            if slow == nil || fast == nil  {
                return false
            }

            slow = slow?.next
            fast = fast?.next?.next
        }

        return true
        //这个有问题。【1】0 即 1 <-> 1 循环时判断错误
//        while slow !== fast {
//
//            slow = slow?.next
//            fast = fast?.next?.next
//
//            if slow === fast {
//                return true
//            }
//
//        }
//
//        return false

    }
}
