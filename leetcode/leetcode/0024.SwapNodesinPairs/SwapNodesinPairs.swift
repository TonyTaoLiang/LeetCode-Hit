//
//  SwapNodesinPairs.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/11/27.
//

import Foundation

class SwapNodesinPairs{

    func swapPairs(_ head: ListNode?) -> ListNode? {

        //最后一个节点（奇数or偶数的情况）
        if head == nil || head?.next == nil{
            return head
        }

        head?.next?.next = swapPairs(head?.next?.next)
        let temp = head?.next
        head?.next = temp?.next
        temp?.next = head
        return temp


    }


}
