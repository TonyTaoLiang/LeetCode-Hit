//
//  SortList.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/11/28.
//

import Foundation

public class SortList {

    func sortList(_ head: ListNode?) -> ListNode? {

        if head?.next == nil || head == nil {
            return head
        }

        let middle = middleNode(head)

        /**
         方法一和方法二的关键区别在于，func middleNode（）方法关于中间节点的选取条件。方法一在节点个数为偶数时如果选择后一个作为中间点，当最后剩下2个节点时会无限递归，栈溢出
         */

        //    //方法一：断开前面一半的链表(left = head->middle.pre ; right = middle->...end)
        //    var cur = head
        //    while cur?.next !== middle{
        //        cur = cur?.next
        //    }
        //    cur?.next = nil

        //方法二：优化一下left = head->middle ; right = middle.next->...end 也比较好，避免了再次循环一次找cur
        let cur = middle?.next
        middle?.next = nil

        //左边是从head开始的一半链表
        let left = sortList(head)
        let right = sortList(cur)

        return mergeTwoLists(left, right)

    }


    private func middleNode(_ head: ListNode?) -> ListNode? {

        if head == nil || head?.next == nil {
            return head
        }
        var slow = head
        var fast = head

        //这是偶数时找后面一个中点（配合上面方法一）
//        while fast != nil && fast?.next != nil {
            //这是偶数时找前面一个中点（配合上面方法二）
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next

        }

        return slow

    }

    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        if l1 == nil {
            return l2
        }

        if l2 == nil {
            return l1
        }

        if l1!.val < l2!.val {

            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        }



        l2?.next = mergeTwoLists(l1, l2?.next)
        return l2

    }

}
