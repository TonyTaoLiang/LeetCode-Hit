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

//使用泛型 OneMoreThing
class TrieNodes<Key:Hashable> {

    var key: Key?

    var isTerminal : Bool = false

    var children : [Key:TrieNodes] = [:]

    init(_ key: Key?) {
        self.key = key
    }
}

//Triess使用泛型是因为这个类后序要操作的（insert，contain）比如string就是一个collection，string中每一个character都会作为key，因此要hashable

/**

            root
            / \
           c   b.
          / \
         a   u
        /     \
       t.      t
                \
                 e.
 */
class Triess<collectionType:Collection> where collectionType.Element : Hashable{

    typealias Node = TrieNodes<collectionType.Element>

    let root = Node(nil)

    init() {}

    //添加的元素word类型 例如String也符合泛型collectionType
    func insert(_ word: collectionType) {

        var current = root

        for element in word {

            if current.children[element] == nil {
                current.children[element] = Node(element)
            }

            current = current.children[element]!

        }

        current.isTerminal = true
    }

}

