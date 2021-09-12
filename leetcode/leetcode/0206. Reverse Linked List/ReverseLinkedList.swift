//
//  ReverseLinkedList.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/9/8.
//

import Foundation


 //Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

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
