//
//  ConvertSortedArrayToBST.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/25.
//

import Foundation

class ConvertSortedArrayToBST{

    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {

        return buildTree(nums, 0, end: nums.count-1)
    }

    //类似 105题根据一棵树的前序遍历与中序遍历构造二叉树
    private func buildTree(_ nums: [Int], _ start: Int, end: Int) -> TreeNode? {

        if start > end {
            return nil
        }

        let middle = start + (end - start)/2
        let root = TreeNode(nums[middle])
        root.left = buildTree(nums, start, end: middle-1)
        root.right = buildTree(nums, middle + 1, end: end)

        return root
    }


    //---------------------错误的解法---------------------
    //最开始是想找出中点，然后简单的写个插入的方法。但是这样的树并是高度平衡的。
    func sortedArrayToBST2(_ nums: [Int]) -> TreeNode? {

        var root = TreeNode(nums[nums.count/2])

        for i in 0..<nums.count {

            if i == nums.count/2 {
                continue
            }

            insert(root, nums[i])

        }

        return root
    }

    private func insert(_ root: TreeNode?, _ value: Int) -> TreeNode? {

        guard let realRoot = root else { return TreeNode(value) }

        if value > realRoot.val {
            realRoot.right = insert(realRoot.right, value)
        } else {
            realRoot.left = insert(realRoot.left, value)
        }

        return realRoot

    }

}
