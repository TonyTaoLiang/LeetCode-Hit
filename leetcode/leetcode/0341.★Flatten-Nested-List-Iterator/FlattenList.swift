//
//  FlattenList.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/29.
//

import Foundation

//NestedInteger这个不就类似多叉树TreeNode吗
//[[1,1],2,[1,1]]

//0代表虚拟节点
//        0
//     /  ｜  \
//    0   2   0
//   / \     / \
//  1   1   1   1
class NestedInteger {

    var val: Int?
    var children: [NestedInteger]?

    init(_ value: Int?, _ children: [NestedInteger]?) {
        self.val = value ?? nil
        self.children = children ?? []
    }

// Return true if this NestedInteger holds a single integer, rather than a nested list.
    public func isInteger() -> Bool{
        return self.val != nil
    }

// Return the single integer that this NestedInteger holds, if it holds a single integer
// The result is undefined if this NestedInteger holds a nested list
    public func getInteger() -> Int{
        return self.val!
    }

// Set this NestedInteger to hold a single integer.
    public func setInteger(value: Int){
        self.val = value
    }

// Set this NestedInteger to hold a nested list and adds a nested integer to it.
    public func add(elem: NestedInteger){
        self.children!.append(elem)
    }

// Return the nested list that this NestedInteger holds, if it holds a nested list
// The result is undefined if this NestedInteger holds a single integer
    public func getList() -> [NestedInteger]{
        return self.children!
    }
 }

class NestedIterator {

    //解法一：在构造函数中提前「扁平化」整个嵌套列表；类似多叉树之间递归遍历整棵树，放到一个数组中
    //用于存放结果
    var res: [Int] = [Int]()
    //结果下标
    var currentIndex = -1
    init(_ nestedList: [NestedInteger]) {

        traversalTreeNode(nestedList)

    }

    func next() -> Int {
        currentIndex += 1
        return res.removeFirst()
    }

    func hasNext() -> Bool {
        return res.count > 0
    }

    //类似多叉树的递归：注意这里的参数是数组
    private func traversalTreeNode(_ nestedInterger: [NestedInteger]){

        nestedInterger.forEach {
            if $0.isInteger() {
                res.append($0.getInteger())
            } else {
                traversalTreeNode($0.getList())
            }

        }
    }
}


/**
 方法二：使用一个栈；对于大部分情况，我们希望迭代器能够一边迭代一边获取当前的结果，而不是提前初始化好。把递归方法 转 迭代方法，我们需要用到「栈」

 递归时间复杂度高的原因： 在递归方法中，我们在遍历时如果遇到一个嵌套的 子list，就立即处理该 子list，直到全部展开；

 在迭代方法中，我们不需要全部展开，只需要把当前list的所有元素放入栈中。

 由于「栈」的先进后出的特性，我们需要逆序在栈里放入各个元素。

 处理流程分为两步：

 在构造函数中应该初始化，把当前列表的各个元素（不用摊平）逆序放入栈中。
 在 hasNext() 方法中，访问（不弹出）栈顶元素，判断是否为 int：
 如果是 int 那么说明有下一个元素，返回 true；然后 next() 就会被调用，把栈顶的 int 弹出；
 如果是 list 需要把当前列表的各个元素（不用摊平）逆序放入栈中。
 如果栈为空，那么说明原始的嵌套列表已经访问结束了，返回 false。

 算法整体的流程，通过举例说明。假如输入 [1, [2,3]] 。

 1. 在构造函数中：栈里面放的应该是 stack = [[2, 3], 1]
 2. 在调用 hasNext() 方法时，访问栈顶元素是 1，为 int，那么直接返回 true;
 3. 然后调用 next() 方法，弹出栈顶元素 1；
 4. 再调用 hasNext() 方法时，访问栈顶元素是 [2,3]，为 list，那么需要摊平，继续放到栈中。
         当前的栈是 stack = [3, 2]
 5. 然后调用 next() 方法，弹出栈顶元素 2；
 6. 然后调用 next() 方法，弹出栈顶元素 3；
 7. 再调用 hasNext() 方法时，栈为空，因此返回 false，迭代器运行结束。

 */
class NestedIterators {

    //在递归方法中，我们在遍历时如果遇到一个嵌套的子list，就立即处理该 子list，直到全部展开；
    //在迭代方法中，我们不需要全部展开，只需要把 当前list 的所有元素放入 list 中。然后在hasNext中去判断慢慢迭代

    //由于「栈」的先进后出的特性，我们需要逆序在栈里放入各个元素

    var stack: Stack<NestedInteger> = Stack()

    init(_ nestedList: [NestedInteger]) {
        //逆序入栈
        nestedList.reversed().forEach {
            self.stack.push($0)
        }

    }

    func next() -> Int {
        //推出栈顶元素
        return self.stack.pop()!.getInteger()
    }

    func hasNext() -> Bool {

//1。判断栈顶是不是单个的Int，是就返回true。
//2。不是则推出栈顶这个list，展开它，逆序将当前这个list里面的所有元素入栈，返回false

        //循环判断栈顶元素
        while !self.stack.isEmpty {

            if self.stack.peek()!.isInteger() {
                return true
            } else {
                //[1,[4,[6]]]
                //1出栈后，栈中剩下一个元素[4,[6]]，弹出[4,[6]]，将其中的子元素入栈
                let nestedList = self.stack.pop()!.getList()
                //把[4,[6]]逆序入栈，栈中现在是二个元素[6],4,栈顶为4
                nestedList.reversed().forEach {
                    self.stack.push($0)
                }
            }

        }

        return false
    }

}
