//
//  BinaryTreePostorderTraversal.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/7.
//

import Foundation

class BinaryTreePostorderTraversal {

    var res = [Int]()

    func postorderTraversal(_ root: TreeNode?) -> [Int] {

        if root == nil {
            return []
        }

        postorderTraversal(root?.left)
        postorderTraversal(root?.right)
        res.append(root!.val)

        return res
    }

}
