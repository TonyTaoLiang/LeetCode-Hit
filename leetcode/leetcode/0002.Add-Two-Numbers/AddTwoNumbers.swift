//
//  AddTwoNumbers.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/2.
//

import Foundation

class AddTwoNumbers {

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        let res: ListNode? = ListNode(0)
        var temp = res
        var l1 = l1, l2 = l2
        var carry = 0

        while l1 != nil || l2 != nil{

            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry

            temp?.next = ListNode(sum % 10)
            temp = temp!.next

            l1 = l1?.next
            l2 = l2?.next

            carry = sum / 10

        }

        if carry > 0 {
            temp?.next = ListNode(1)
        }

        return res?.next
    }
}
