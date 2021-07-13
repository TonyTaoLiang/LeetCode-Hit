//
//  InvertTree.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/7/14.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class InvertTree {

    func invertTree(_ root: TreeNode?) -> TreeNode? {

        if root == nil {
            return nil
        }

        let left = invertTree(root?.left)
        let right = invertTree(root?.right)

        root?.right = left
        root?.left = right

        return root
    }

    /*
     霜神Go写法：没有返回值一样的
     func invertTree(root *TreeNode) *TreeNode {
         if root == nil {
             return nil
         }
         invertTree(root.Left)
         invertTree(root.Right)
         root.Left, root.Right = root.Right, root.Left
         return root
     }
     */
}
