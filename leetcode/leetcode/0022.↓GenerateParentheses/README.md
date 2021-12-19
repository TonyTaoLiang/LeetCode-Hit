# [22. Generate Parentheses](https://leetcode.com/problems/generate-parentheses/)


## 题目

Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

For example, given n = 3, a solution set is:


    [
      "((()))",
      "(()())",
      "(())()",
      "()(())",
      "()()()"
    ]


## 题目大意

给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。


## 解题思路

- 这是一道典型的DFS题，类似46:全排列 ；784:字母大小写全排列；77:组合。其实DFS有点类似回溯，不断进入下一层，按条件罗列每一层的所有选择，然后找到最终条件回退上一层，换另外一种选择。

- 模版
```
/// - Parameters:
///   - index: 搜索的层号
///   - c: 用来存放每一层的选择


func dfs(_ nums: [Int], _ index: Int, _ c: inout [Int], _ res: inout [[Int]]) {

    //进入了最后一层 把此次结果添加进入最终的结果
    if index == nums.count {
        res.append(c)
        return
    }
   
   
    //枚举这一层的所有选择，然后进入下一层
    //因为46题77题每一层都是在一个数组里面有多种选择，所以是for循环
    for i in 0..<nums.count {
    
    c.append(nums[i])
    bfsPermute(nums, index + 1, &c, &res, &used)
    //注意回退时需要做相反的操作
    c.removeLast()
    
    }

    //22题 括号排列 和784字母排列，每一层就2/3种选择就没必要for循环，或者说是把for循环剖开，罗列出来而已。
    
    //784题：就3种可能选择
    //数字选择
    if s[depth].isNumber {
        return dfsLetterPermutation(&s, depth + 1, &res)
    }
    //当前选择
    dfsLetterPermutation(&s, depth + 1, &res)
    //改变大小写->另外一个选择
    dfsLetterPermutation(&s, depth + 1, &res)
    
    //22题：每一层有2个选择 要么左 要么右
    //左括号还有剩余就能选
    if leftRemain > 0 {
        //因为每次是覆盖了当前位置的值，不是append所以回溯时不用做相反操作
        characters[index] = "("
        //下一层
        dfsParenthesis(index+1, leftRemain-1, rightRemain, &characters, &res)
    }

    //右括号的剩下的比左括号多才能选右括号
    if rightRemain > 0 && leftRemain < rightRemain {
        characters[index] = ")"
        dfsParenthesis(index+1, leftRemain, rightRemain-1, &characters, &res)
    }
    
}

```

27:03
