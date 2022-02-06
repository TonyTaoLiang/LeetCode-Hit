//
//  BinaryTreePreorderTraversal.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/6.
//

import Foundation

class BinaryTreePreorderTraversal {

    var res : [Int] = [Int]()

    func preorderTraversal(_ root: TreeNode?) -> [Int] {

        if root == nil {
            return []
        }
        
        res.append(root!.val)

        preorderTraversal(root?.left)

        preorderTraversal(root?.right)

        return res
    }

}

