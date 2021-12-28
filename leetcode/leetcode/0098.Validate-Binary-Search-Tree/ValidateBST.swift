//
//  ValidateBST.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/28.
//

import Foundation


class ValidateBST {
    //问题是，对于某一个节点 root，他只能管得了自己的左右子节点，怎么把 root 的约束传递给左右子树呢？
    //我们通过使用辅助函数，增加函数参数列表，在参数中携带额外信息，将这种约束传递给子树的所有节点，这也是二叉树算法的一个小技巧
    func isValidBST(_ root: TreeNode?) -> Bool {

        return _isValidBST(root, Int.min, Int.max)

    }

    //如果该二叉树的左子树不为空，则左子树上所有节点的值均小于它的根节点的值； 若它的右子树不空，则右子树上所有节点的值均大于它的根节点的值；它的左右子树也为二叉搜索树。
    //以 root 为根的子树节点必须满足 max.val > root.val > min.val
    private func _isValidBST(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool{
        // 若 root.val 不符合 max 和 min 的限制，说明不是合法 BST
        if root == nil {
            return true
        }
        // 若 root.val 不符合 max 和 min 的限制，说明不是合法 BST
        if root!.val >= max {
            return false
        }

        if root!.val <= min {
            return false
        }
        // 限定左子树的最大值是 root.val，右子树的最小值是 root.val
        return _isValidBST(root?.left, min, root!.val) && _isValidBST(root?.right, root!.val, max)

    }



    //解法二：中序遍历，如果是BST，遍历的序列一定是升序的
    func isValidBST2(_ root: TreeNode?) -> Bool {

        var array = [Int]()
        traversalInorder(root, &array)

        for i in 1..<array.count {

            if array[i-1] >= array[i] {
                return false
            }

        }
        return true

    }

    func traversalInorder(_ root: TreeNode?, _ array: inout [Int]) {

        if root == nil {
            return
        }

        traversalInorder(root?.left, &array)
        array.append(root!.val)
        traversalInorder(root?.right, &array)

    }

}
