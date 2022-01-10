//
//  DeleteNodeLinkedList.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/10.
//

import Foundation

class DeleteNodeLinkedList {


    func deleteNode(_ node: ListNode?) {
        //自己变成儿子，再把儿子删掉
        node?.val = (node?.next!.val)!
        node?.next = node?.next?.next

    }
    
}
