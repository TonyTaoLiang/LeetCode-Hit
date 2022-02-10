//
//  NTreePostTraversal.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/10.
//

import Foundation

class NTreePostTraversal {

    var res = [Int]()

    func postorder(_ root: Node?) -> [Int] {

        guard let root = root else { return [] }

        for child in root.children {
            postorder(child)
        }

        res.append(root.val)

        return res
    }

    //100%
    func postorder1(_ root: Node?) -> [Int] {
        guard let r = root else { return [] }
        return r.children.reduce([]){$0 + postorder1($1)} + [r.val]

    }
}
