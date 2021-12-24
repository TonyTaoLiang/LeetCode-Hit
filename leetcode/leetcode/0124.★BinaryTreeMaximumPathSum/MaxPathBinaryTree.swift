//
//  MaxPathBinaryTree.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/24.
//

import Foundation

class MaxPathBinaryTree{

    func maxPathSum(_ root: TreeNode?) -> Int {

        //不能是0，二叉树可能全是负数 ,初始为0，最终解也是0，实际应该是一个负数
        var res = Int.min
        traversePostOrder(root, &res)
        return res

    }
     /**

         a
        / \
       b   c

     一个二叉树单元，路径只有三种
     1.a + b
     2.a + c
     3.a + b + c
     */

    //后序遍历
    //返回值是Int就能累加每个节点能提供的最大值。开始把返回值设为TreeNode不好操作
    private func traversePostOrder(_ root: TreeNode?, _ res: inout Int) -> Int{

        if root == nil {
            return 0
        }

        let leftNodeVal = traversePostOrder(root?.left, &res)
        let rightNodeVal = traversePostOrder(root?.right, &res)

        //每一个节点能够提供的最大值(如果左右为负，则忽略。但这个中心节点无论是向上还是连接左右作为联络点不能舍弃)
        //这个值也是上面3种路径中，1，2种其中的一个
        let currentMax = max(max(leftNodeVal, rightNodeVal) + root!.val , root!.val)

        //比较路径1，2中的最大值，和第三种路径，更新到最终解
        res = max(res, max(currentMax, leftNodeVal + rightNodeVal + root!.val))

        return currentMax
    }

}
