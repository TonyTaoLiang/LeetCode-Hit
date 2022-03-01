//
//  ReverseKNodes.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/3/1.
//

import Foundation

class ReverseKNodes {

    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {

        var newHead = head

        for _ in 0..<k {
            //不够长，则直接返回head（递归终止条件）
            if newHead == nil {
                return head
            }
            newHead = newHead?.next

        }

        let resNode = reverseNode(head, newHead)

        head?.next = reverseKGroup(newHead, k)//下面方法调用后head指向未翻转的K+1Node，此时将head重新指向反转后的node

        return resNode//每次递归返回反转后的头节点
    }

    func reverseNode(_ first: ListNode?, _ last: ListNode?) -> ListNode? {

        var first = first
        var pre = last//pre初始为K后面的一个节点，不是反转链表的nil

        while first !== last {

            let temp = first?.next
            first?.next = pre
            pre = first
            first = temp

        }

        return pre
    }
}
