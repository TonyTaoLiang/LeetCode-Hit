//
//  IntersectionofTwoLinkedLists.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/7/12.
//

import Foundation

class IntersectionofTwoLinkedLists {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }

    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {

        if headA == nil || headB == nil {
            return nil
        }

        var a = headA
        var b = headB

        while a !== b {

            a = a == nil ? headB : a?.next
            b = b == nil ? headA : b?.next

        }

        return a
    }

}
