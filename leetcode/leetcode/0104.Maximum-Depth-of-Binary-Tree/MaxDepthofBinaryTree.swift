//
//  MaxDepthofBinaryTree.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/20.
//

import Foundation

class MaxDepthofBinaryTree{

    var res = 0

    func maxDepth(_ root: TreeNode?) -> Int {

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
