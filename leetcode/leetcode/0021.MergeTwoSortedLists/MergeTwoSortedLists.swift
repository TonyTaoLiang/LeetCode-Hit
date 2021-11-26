//
//  MergeTwoSortedLists.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/11/25.
//

import Foundation


class MergeTwoSortedLists{
    //类似归并排序的方式
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var res = ListNode()
        let head = res
        var templ1 = l1
        var templ2 = l2

        while templ1 != nil && templ2 != nil {

            if templ1!.val < templ2!.val {

                res.next = templ1
                templ1 = templ1?.next
            }else{

                res.next = templ2
                templ2 = templ2?.next
            }

            res = res.next!
        }

        res.next = templ1 ?? templ2

        return head.next
    }

    //递归
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        if l1 == nil {
            return l2
        }

        if l2 == nil {
            return l1
        }

        if l1!.val < l2!.val {
            l1?.next = mergeTwoLists2(l1?.next, l2)
            return l1
        }


        l2?.next = mergeTwoLists2(l1, l2?.next)
        return l2
    }
    
}
