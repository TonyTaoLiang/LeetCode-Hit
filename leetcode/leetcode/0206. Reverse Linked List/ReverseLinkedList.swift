//
//  ReverseLinkedList.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/9/8.
//

import Foundation

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {

        var behind: ListNode?
        var temp = head
        var front = head

        while temp != nil {

            front = front?.next
            temp?.next = behind
            behind = temp
            temp = front

        }

        return behind
    }
}
