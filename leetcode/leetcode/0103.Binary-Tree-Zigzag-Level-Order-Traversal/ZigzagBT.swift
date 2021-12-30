//
//  ZigzagBT.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/30.
//

import Foundation

class ZigzagBT {

    var queue: QueueArray<TreeNode> = QueueArray()
    var res = [[Int]]()
    var preorder: Bool = true

    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {

        if root == nil {
            return res
        }

        self.queue.enqueue(root!)

        while !queue.isEmpty {

            let size = queue.size
            var array = Array(repeating: 0, count: size)

            for i in 0..<size {

                let dequeue = queue.dequeue()!

                if preorder {
                    array[i] = dequeue.val
                }else {
                    array[size-i-1] = dequeue.val
                }

                if dequeue.left != nil {
                    queue.enqueue(dequeue.left!)
                }
                if dequeue.right != nil {
                    queue.enqueue(dequeue.right!)
                }
            }

            res.append(array)
            preorder = !preorder

        }

        return res
    }

}
