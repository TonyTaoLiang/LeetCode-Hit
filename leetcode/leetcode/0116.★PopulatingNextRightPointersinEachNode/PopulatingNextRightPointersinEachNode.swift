//
//  PopulatingNextRightPointersinEachNode.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/11.
//

import Foundation
public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class NextRightPoint{

    //100%高手的写法
    func connect1(_ root: Node?) -> Node? {
            if root == nil{
                return nil
            }
            if let left = root!.left{
                left.next = root!.right
                //咋没想到这样处理
                root!.right?.next = root!.next == nil ? nil :root?.next?.left
                connect(left)
                connect(root?.right)
            }
            return root
    }

    func connect(_ root: Node?) -> Node? {

        if root == nil {
            return nil
        }

        connectTwoNode(root?.left, root?.right)

        return root
    }

    func connectTwoNode(_ root1: Node? , _ root2: Node?) {

        if root2 == nil || root1 == nil {
            return
        }

        root1?.next = root2

        connectTwoNode(root1?.left, root1?.right)
        connectTwoNode(root2?.left, root2?.right)
        connectTwoNode(root1?.right, root2?.left)

    }

}
