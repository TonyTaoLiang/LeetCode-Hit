//
//  MergeTwoBinaryTrees.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/11.
//

import Foundation

class MergeTwoBinaryTrees{

    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {

        //自己的写法 创建了node 空间复杂度高
//        let node = TreeNode(0)
//
//        if root1 != nil && root2 != nil {
//            node.val = root2!.val + root1!.val
//        } else if root1 == nil && root2 == nil{
//            return nil
//        } else if root1 != nil && root2 == nil{
//            node.val = root1!.val
//        } else if root1 == nil && root2 != nil{
//            node.val = root2!.val
//        }
//
//        node.left = mergeTrees(root1?.left, root2?.left)
//        node.right = mergeTrees(root1?.right, root2?.right)
//
//        return node

        //霜神优秀的写法
        if root1 == nil {
            return root2
        }

        if root2 == nil {
            return root1
        }

        root1?.val += root2?.val ?? 0

        root1?.left = mergeTrees(root1?.left, root2?.left)
        root1?.right = mergeTrees(root1?.right, root2?.right)

        return root1
    }

}
