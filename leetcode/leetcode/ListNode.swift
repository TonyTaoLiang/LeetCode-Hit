//
//  ListNode.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/11/28.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }


    //打印链表当前元素 - 方便调试
    func linkedListPrint() -> [Int] {
        var nodes = [Int]()
        var curNode: ListNode? = self
        while curNode != nil {
            nodes.append(curNode!.val)
            curNode = curNode?.next
        }
        return nodes
    }

}
