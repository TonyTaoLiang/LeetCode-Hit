//
//  BTLevelOrderTraversal.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/27.
//

import Foundation

class BTLevelOrderTraversal {

    var res = [[Int]]()
    var queue = QueueArray<TreeNode>()

    //BFS
    func levelOrder1(_ root: TreeNode?) -> [[Int]] {

        if root == nil {
            return res
        }

        queue.enqueue(root!)

        while !queue.isEmpty {

            var array = [Int]()

            //每一次只操作一层的数量，通过数量把层区别开，类似腐烂橘子
            for i in 0..<queue.size {

                let dequeue = queue.dequeue()!
                array.append(dequeue.val)

                if dequeue.left != nil {
                    queue.enqueue(dequeue.left!)
                }
                if dequeue.right != nil {
                    queue.enqueue(dequeue.right!)
                }

            }

            res.append(array)
        }

        return res

    }


    //DFS
    func levelOrder2(_ root: TreeNode?) -> [[Int]] {

        if root == nil {
            return res
        }

        dfslevelOrder(root, 0)
        return res
    }

    func dfslevelOrder(_ root: TreeNode?, _ depth: Int) {

        if root == nil {
            return
        }

        //初始化内部数组
        if depth == res.count {
            res.append([Int]())
        }

        //前序加入
        res[depth].append(root!.val)
        dfslevelOrder(root?.left, depth + 1)
        dfslevelOrder(root?.right, depth + 1)

    }
}
