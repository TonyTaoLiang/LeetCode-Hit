//
//  NTreePreorderTraversal.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/9.
//

import Foundation

public class Node {
     public var val: Int
     public var children: [Node]
     public init(_ val: Int) {
         self.val = val
         self.children = []
     }
 }

class NTreePreorderTraversal {

    //解法一：递归
    var res: [Int] = [Int]()

    func preorder(_ root: Node?) -> [Int] {

        if root == nil {
            return []
        }

        res.append(root!.val)

        for child in root!.children {
            preorder(child)
        }

        return res
    }

    //解法二：模拟一个栈 100%
    func preorder1(_ root: Node?) -> [Int] {

        guard let root = root else { return [] }
        var res = [Int]()
        var stack = [root]

        while !stack.isEmpty {

            let node = stack.removeLast()
            res.append(node.val)
            node.children.reversed().forEach { stack.append($0) }

        }

        return res
    }
}
