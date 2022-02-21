//
//  LRU.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/21.
//

import Foundation

class DoubleLinkNode {

    var key: Int?
    var value: Int?
    var pre: DoubleLinkNode?
    var next: DoubleLinkNode?

    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }

    init() {}
}

//双向链表 + Hashmap实现O(1)
class LRU {

    var capacity: Int
    var map: [Int : DoubleLinkNode]
    //虚拟头节点
    var first: DoubleLinkNode = DoubleLinkNode()
    //虚拟尾节点
    var last: DoubleLinkNode = DoubleLinkNode()


    init(_ capacity: Int) {
        self.map = Dictionary(minimumCapacity: capacity)
        self.capacity = capacity
        //初始化虚拟节点
        first.next = last
        last.pre = first
    }

    func get(_ key: Int) -> Int {

        //缓存查不到返回-1
        guard let node = map[key] else { return -1 }

        //缓存命中
        //1.从链表中移除这个元素
        removeNode(node)

        //2.把这个元素移动到first后面，成为最新使用的元素
        addAfterFirst(node)

        return node.value!
    }

    func put(_ key: Int, _ value: Int) {

        guard let node = map[key] else {

            //未命中，添加新的key-value。二种情况。1.缓存已满。2.缓存未满
            if capacity == map.values.count {

                //已满,从map中淘汰最近最少使用的node
                if let deleteNode = last.pre {

                    map.removeValue(forKey: deleteNode.key!)//map中删除
                    removeNode(deleteNode)//链表中也删除

                }

            }

            //未满或者已满，都将新的node，加入map缓存，同时移动到最前
            let newNode = DoubleLinkNode(key, value)
            map[key] = newNode
            addAfterFirst(newNode)

            return
        }


        //缓存命中
        node.value = value
        //1.从链表中移除这个元素
        removeNode(node)
        //2.把这个元素移动到first后面，成为最新使用的元素
        addAfterFirst(node)
    }

    func removeNode(_ node: DoubleLinkNode) {

        node.pre?.next = node.next
        node.next?.pre = node.pre

    }

    func addAfterFirst(_ node: DoubleLinkNode) {

        //node与first.next
        first.next?.pre = node
        node.next = first.next

        //node与first
        first.next = node
        node.pre = first

    }

}
