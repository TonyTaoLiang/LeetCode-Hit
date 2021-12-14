# [784. Letter Case Permutation](https://leetcode.com/problems/letter-case-permutation/)


## 题目

Given a string S, we can transform every letter individually to be lowercase or uppercase to create another string. Return a list of all possible strings we could create.

    Examples:
    Input: S = "a1b2"
    Output: ["a1b2", "a1B2", "A1b2", "A1B2"]
    
    Input: S = "3z4"
    Output: ["3z4", "3Z4"]
    
    Input: S = "12345"
    Output: ["12345"]

**Note:**

- `S` will be a string with length between `1` and `12`.
- `S` will consist only of letters or digits.


## 题目大意


给定一个字符串 S，通过将字符串 S 中的每个字母转变大小写，我们可以获得一个新的字符串。返回所有可能得到的字符串集合。

## 解题思路


- 输出一个字符串中字母变大写，小写的所有组合。
- DFS 深搜或者 BFS 广搜都可以。

自上而下
||             abc
||        /           \
||      abc           Abc
||    /    \         /    \
||  abc    aBc     Abc    ABc
|| /  \    /  \    / \     / \
||abc abC aBc aBC Abc AbC ABc ABC
vv  ....

char c = '字母'
c ^= (1 << 5)
可以不用知道字母 c 的大小写的情况，做大小写切换。

//就把它当成一颗二叉树，left，right就是大，小写。遇到数字（没有左右分支了）回溯去上一层不做处理，继续下一轮
//当每走到一个“路口”时面临的选择只有三个(其实只有2个)：
//大写
//小写
//数字 “死路”不用去试
//那在对字符做遍历时，每遇到一个字母，就分出2个分支出来分别再往下遍历。
[3种回溯解法](https://leetcode-cn.com/problems/letter-case-permutation/solution/3chong-hui-su-jie-fa-by-fengziluo-oirf/)
