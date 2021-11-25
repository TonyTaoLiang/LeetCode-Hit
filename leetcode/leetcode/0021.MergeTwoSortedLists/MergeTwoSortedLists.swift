//
//  MergeTwoSortedLists.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/11/25.
//

import Foundation


class MergeTwoSortedLists{
    //快排的方式13.62% 9.36%
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

    
}
