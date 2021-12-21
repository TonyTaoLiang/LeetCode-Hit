//
//  SymmetricTree.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/21.
//

import Foundation

class SymmetricTree{

    func isSymmetric(_ root: TreeNode?) -> Bool {

        //有点类似 填充每个节点的下一个右侧节点指针

        return isMirror(root?.left, root?.right)

    }

    func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool{

        // 都为空，符合 mirror 树条件
        if left == nil && right == nil {
            return true
        }
        // 有一个为空，不符合镜像条件
        if left == nil || right == nil {
            return false
        }
        //左右对称则进入下一层
        if left?.val != right?.val {
            return false
        }
        // 比较 root1 和 root2 对称位置是否符合镜像条件
        return isMirror(left?.left, right?.right) && isMirror(left?.right, right?.left)
    }

}
