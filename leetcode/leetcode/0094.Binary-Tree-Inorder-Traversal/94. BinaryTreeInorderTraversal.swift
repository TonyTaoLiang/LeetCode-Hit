//
//  94. BinaryTreeInorderTraversal.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/9/9.
//

import Foundation


func inorderTraversal(_ root: TreeNode?) -> [Int] {

    var array: [Int] = []

    if root == nil {
        return []
    }

    let left = inorderTraversal(root?.left)
    guard let value = root?.val else { return []}
    array.append(value)
    let right = inorderTraversal(root?.right)

    return left + array + right
}

