//
//  0105.ConstructBinaryTreefromPreorderandInorderTraversal.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/11/23.
//

import Foundation

class ConstructBinaryTreePreorderInorder {

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

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {

        guard preorder.count == inorder.count else {
            return nil
        }


        return _buildTree(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)

    }

    func _buildTree(_ preorder: [Int], _ preStart: Int, _ preEnd: Int, _ inorder: [Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {

        guard preStart <= preEnd && inStart <= inEnd else {
            return nil
        }

        //找出根节点在中序数组中的位置，前序的第一个就是根
        //inorder.firstIndex系统API省去自己构造HashMap或者遍历中序数组的繁琐操作
        guard let rootIndex = inorder.firstIndex(of: preorder[preStart]) else {
            return nil
        }

        let root = TreeNode(inorder[rootIndex])
        //preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
        //递归地构造左子树，并连接到根节点
        // 先序遍历中「从 左边界+1 开始的 rootIndex - inStart」个元素就对应了中序遍历中「从 左边界 开始到 根节点定位-1」的元素(这个范围就是左子树的部分)
        root.left = _buildTree(preorder, preStart + 1, rootIndex - inStart + preStart, inorder, inStart, rootIndex - 1)

        // 递归地构造右子树，并连接到根节点
        // 先序遍历中「从 左边界+1+左子树节点数目 开始到 右边界」的元素就对应了中序遍历中「从 根节点定位+1 到 右边界」的元素

        root.right = _buildTree(preorder, preStart + rootIndex - inStart + 1, preEnd, inorder, rootIndex + 1, inEnd)


        return root
    }



}
