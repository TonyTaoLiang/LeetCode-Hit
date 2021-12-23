//
//  KthSmallestBST.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/23.
//

import Foundation

class KthSmallestBST {

    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {

        var depth = 0
        var res = 0
        dfsTree(root, k, &depth, &res)
        return res
    }

    private func dfsTree(_ root: TreeNode?, _ k: Int, _ depth: inout Int, _ res: inout Int){

        if root == nil {
            return
        }
        dfsTree(root?.left, k, &depth, &res)
        depth += 1
        if depth == k {
            res = root!.val
            return
        }
        dfsTree(root?.right, k, &depth, &res)
    }

}
