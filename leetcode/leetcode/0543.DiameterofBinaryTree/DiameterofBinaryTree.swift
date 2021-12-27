//
//  DiameterofBinaryTree.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/27.
//

import Foundation

class DiameterofBinaryTree {

    var res = 0

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {

        maxDepth(root)

        return res
    }

    //返回每一个节点的深度值(后序遍历)
    func maxDepth(_ root: TreeNode?) -> Int {

        if root == nil {
            return 0
        }

        let leftDepth = maxDepth(root?.left)
        let rightDepth = maxDepth(root?.right)

        //计算直径：每一条二叉树的「直径」长度就是一个节点的左右子树的最大深度之和
        res = max(res, leftDepth + rightDepth)

        //每个节点的深度=左右子树的最大深度+1（自己）
        return max(leftDepth, rightDepth) + 1
    }
}
