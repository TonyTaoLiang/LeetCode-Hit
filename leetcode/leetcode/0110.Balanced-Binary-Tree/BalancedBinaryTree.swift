//
//  BalancedBinaryTree.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/13.
//

import Foundation

class BalancedBinaryTree {

    func isBalanced(_ root: TreeNode?) -> Bool {

        if root == nil {
            return true
        }

        if abs(heightForNode(root?.left) - heightForNode(root?.right)) > 1{
            return false
        }

        //依次递归，左右子树都得是平衡二叉树
        return isBalanced(root?.left) && isBalanced(root?.right)

        //18行～23行可合并
//        return abs(heightForNode(root?.left) - heightForNode(root?.right)) <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
    }

    //104题计算树节点的高度
    func heightForNode(_ root: TreeNode?) -> Int {

        if root == nil {
            return 0
        }

        return max(heightForNode(root?.left), heightForNode(root?.right)) + 1
    }
}
