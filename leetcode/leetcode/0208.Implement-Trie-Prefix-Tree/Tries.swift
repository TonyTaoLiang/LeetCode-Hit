//
//  Tries.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/4.
//

import Foundation

class TrieNode<Key : Hashable> {

    var isTerminal = false

    var key : Key? //数据data

    var children : [Key : TrieNode] = [:]

    var parent : TrieNode?

    init(_ key: Key? , _ parent: TrieNode?) {

        self.key = key
        self.parent = parent
    }

}

class Tries{

    typealias Node = TrieNode<Character>

    private let root = Node(nil, nil)

    init() {
    }

    func insert(_ word: String) {

        var current = root

        for element in word {

            if current.children[element] == nil {

                current.children[element] = Node(element, current)

            }

            current = current.children[element]!

        }

        current.isTerminal = true
    }

    func search(_ word: String) -> Bool {

        var current = root

        for element in word {

            guard let child = current.children[element] else {

                return false

            }

            current = child
        }

        return current.isTerminal

    }


    func startsWith(_ prefix: String) -> Bool {

        var current = root

        for element in prefix {

            guard let child = current.children[element] else {
                //没查到
                return false

            }

            current = child
        }

        return true
    }
}
