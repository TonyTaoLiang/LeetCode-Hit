//
//  RemoveNthNodeEndList.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/5.
//

import Foundation

class RemoveNthNodeEndList{

    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        if head == nil {
            return nil
        }
        
        if n <= 0 {
            return head
        }

        let dummyHead: ListNode? = ListNode(0, head)
        var pi = head
        var pj = dummyHead
        var index = n
        
        while pi?.next != nil {
            
            pi = pi?.next
            index -= 1
            
            if index <= 0 {
                
                pj = pj?.next
                
            }
            
        }
        
        
        let deleteNode = pj?.next
        pj?.next = pj?.next?.next
        deleteNode?.next = nil
        
        return dummyHead?.next
        
    }

}
