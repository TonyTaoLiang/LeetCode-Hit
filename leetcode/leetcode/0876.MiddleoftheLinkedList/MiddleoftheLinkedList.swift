//
//  MiddleoftheLinkedList.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/11/28.
//

import Foundation

class MiddleoftheLinkedList {

    func middleNode(_ head: ListNode?) -> ListNode? {

        if head == nil || head?.next == nil {
            return head
        }
        var slow = head
        var fast = head

        while fast != nil && fast?.next != nil {

            slow = slow?.next
            fast = fast?.next?.next

        }

        return slow

    }
}
