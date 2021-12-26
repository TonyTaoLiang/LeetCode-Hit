//
//  CommonAncestorBT.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/26.
//

import Foundation

class CommonAncestorBT {


    //解法一：
    /**
     采用先序遍历，对递归有了新的理解。
     1.return即是结束此层递归，向上回溯。如果递归函数有返回值，那么return value就是向上回溯传递这个返回值。
     2.常规的二叉树前序，后序，中序遍历最后都是return root，即把当前的这个节点回溯，向上传递。
     3.此题不同，在最后一行return root前，就提前做了判断，可能会提前结束此层递归，此时回溯向上传递的可能并不是当前的这个节点，而是是不断的向上传递null，或者是p，q，或者是这个节点。

     思路：考虑通过递归对二叉树进行先序遍历，当遇到节点 p 或 q 时返回向上传递p，q。从底至顶回溯，当节点 p, q 在节点 root 的异侧时（说明p，q在向上传递的过程中出现了交叉，这个节点就是最终的结果），节点 root 即为最近公共祖先，则继续向上返回 root，把这个最终结果传上去，直至整棵树遍历完。

     递归解析：
     1.终止条件：
     当越过叶节点，则直接返回 null ；
     当 root 等于 p,q ，则直接返回 当前root，把p，q传上去。因为没要必要继续深入下一层了，公关祖先肯定是在上面的父节点；

     2.递推工作：
     开启递归左子节点，返回值记为 left ；
     开启递归右子节点，返回值记为 right ；

     3.返回值： 根据 left 和 right ，可展开为四种情况；
     （1）当 left 和 right 同时为空 ：说明p,q均没有向上回溯传递过来， root 的左 / 右子树中都不包含 p,q ，返回 null ；
     （2）当 left 和 right 同时不为空 ：说明p，q在向上传递的过程中出现了交叉，这个节点就是最终的结果。也可以说p,q 分列在 root 的 异侧 （分别在 左 / 右子树），因此 root 为最近公共祖先，返回 root ；
     （3）当 left 为空 ，right 不为空 ：p,q 都不在 root 的左子树中，直接返回 right 。这个right具体可分为两种情况：
         <1>p,q 其中一个在 root 的 右子树 中，此时 right 指向 p（假设为 p ，也可能是 q）；
         <2>p,q 两节点都在 root 的 右子树 中，此时的 right 指向 最近公共祖先节点 （因为是先序遍历，假设p是q的祖先，那么p在之前就传递上去return了，其实没有必要进入深一层的q，那么此时p就是最近公共祖先节点）；
      (4)当left不为空 ，right为空 ：与情况 3. 同理；

     PS:观察发现， 情况 (1) 可合并至 (3) 和 (4) 内.

     */

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {

        //前序遍历
        if root == nil || root?.val == p?.val || root?.val == q?.val {
            return root
        }

        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)

        //对应情况（3）。PS：情况（1）均为空时也会进来 返回right，right也是空 即返回null
        if left == nil {
            //此时拦截最后的return root 。提前回溯，上传返回的p，或者q。
            return right
        }
        //对应情况（4）
        if right == nil {
            //此时拦截最后的return root 。提前回溯，上传返回的p，或者q。
            return left
        }

        //对应情况（2）均不为空 说明p，q上传出现交叉。则返回当前root最近公共祖先
        return root
    }
    //解法二：
    /**
     思路：
     我们可以用哈希表存储所有节点的父节点，然后我们就可以利用节点的父节点信息从 p 结点开始不断往上跳，并记录已经访问过的节点，再从 q 节点开始不断往上跳，如果碰到已经访问过的节点，那么这个节点就是我们要找的最近公共祖先。

     算法：
     从根节点开始遍历整棵二叉树，用哈希表记录每个节点的父节点指针。
     从 p 节点开始不断往它的祖先移动，并用数据结构记录已经访问过的祖先节点。
     同样，我们再从 q 节点开始不断往它的祖先移动，如果有祖先已经被访问过，即意味着这是 p 和 q 的深度最深的公共祖先，即 LCA 节点。
     */
    var fatherNodes = [Int : TreeNode]()
    var visited = [TreeNode]()

    private func dfs(_ root: TreeNode?) {

        if root == nil {
            return
        }
        dfs(root?.left)
        dfs(root?.right)

        if root?.left != nil {
            //注意key是它的左子节点
            fatherNodes[root!.left!.val] = root
        }

        if root?.right != nil {
            //注意key是它的右子节点
            fatherNodes[root!.right!.val] = root
        }

    }

    func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {

        //获取所有父节点
        dfs(root)

        var p = p
        while p != nil {
            //依次加入走过的路径
            visited.append(p!)
            //去往上一层，移动到父节点
            p = fatherNodes[p!.val]

        }

        var q = q
        while q != nil {

            //q的父节点已被访问过
            if visited.contains(where: { node in
                node.val == q!.val
            }) {
                return q
            }

            q = fatherNodes[q!.val]

        }

        return nil

    }

    //自己错误的思路：类似题解的解法二---想到了后序遍历，字典存储，但还是没想透，
    //后序遍历(加入的都是父节点或者p，q)，字典存依次该加入的节点， 如果2个节点都已在里面，则返回字典中最后一个
    func lowestCommonAncestor3(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {

        var res = [Int : TreeNode]()
        let result = traversePostOrder(root, p, q, &res)
        return result
        
    }


    private func traversePostOrder(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?, _ res: inout [Int : TreeNode]) -> TreeNode? {

        guard let p = p else {return nil}
        guard let q = q else {return nil}

        if root == nil {
            return nil
        }

        let left = traversePostOrder(root?.left, p, q, &res)
        let right = traversePostOrder(root?.right, p, q, &res)

        if root!.val == p.val || root!.val == q.val{

            res[root!.val] = root

        }else {

            if let leftNode = left {

                if res[leftNode.val] != nil {
                    res[root!.val] = root
                }

            }

            if let rightNode = right {

                if res[rightNode.val] != nil {
                    res[root!.val] = root
                }

            }

        }

        if res[p.val] != nil && res[q.val] != nil {

            let array: [TreeNode] = Array(res.values)
            return array.last

        }


        return root
    }
}
