//
//  MaxDepthofBinaryTree.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/20.
//

import Foundation

class MaxDepthofBinaryTree{

    var res = 0

    //二叉树的最大深度即为max(l,r)+1；而它的左子树，右子树就是它的子问题求解
    func maxDepth(_ root: TreeNode?) -> Int {

        if root == nil {
            return 0
        }

        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1

    }

    //模版
    func maxDepth2(_ root: TreeNode?) -> Int {

        dfsDepth(root, 0)

        return res
    }

    func dfsDepth(_ root: TreeNode?, _ depth: Int) {

        if root == nil {
            res = max(res, depth)
            return
        }

        dfsDepth(root?.left, depth + 1)
        dfsDepth(root?.right, depth + 1)

    }
}
