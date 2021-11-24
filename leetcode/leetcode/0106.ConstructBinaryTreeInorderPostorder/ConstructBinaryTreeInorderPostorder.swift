//
//  ConstructBinaryTreeInorderPostorder.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/11/23.
//

import Foundation

class ConstructBinaryTreeInorderPostorder{

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


    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {

        guard inorder.count == postorder.count else {
            return nil
        }

        return _buildTree(inorder, 0, inorder.count - 1, postorder, 0, postorder.count - 1)
    }

    func _buildTree(_ inorder: [Int], _ inStart: Int, _ inEnd: Int, _ postorder: [Int], _ postStart: Int, _ postEnd: Int) -> TreeNode? {

        guard inStart <= inEnd && postStart <= postEnd else {
            return nil
        }

        guard let rootIndex = inorder.firstIndex(of: postorder[postEnd]) else {
            return nil
        }

        let root = TreeNode(inorder[rootIndex])

        root.left = _buildTree(inorder, inStart, rootIndex - 1, postorder, postStart, postEnd - inEnd + rootIndex)

        root.right = _buildTree(inorder, rootIndex + 1, inEnd, postorder, postEnd - inEnd + rootIndex, postEnd - 1)

        return root
    }
}
