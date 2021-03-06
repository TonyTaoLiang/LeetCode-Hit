# [171. Excel Sheet Column Number](https://leetcode.com/problems/excel-sheet-column-number/)


## 题目

Given a column title as appear in an Excel sheet, return its corresponding column number.

For example:

```
    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
    ...
```

**Example 1**:

```
Input: "A"
Output: 1
```

**Example 2**:

```
Input: "AB"
Output: 28
```

**Example 3**:

```
Input: "ZY"
Output: 701
```

## 题目大意

给定一个 Excel 表格中的列名称，返回其相应的列序号。


## 解题思路

- 给出 Excel 中列的名称，输出其对应的列序号。
- 简单题。这一题是第 168 题的逆序题。按照 26 进制还原成十进制即可。
- “FXSHRXW” 中的每个字母对应的序号分别是：[6,24,19,8,18,24,23]（其中A 到 Z 分别对应 1 到 26），则列名称对应的列序号为：

23 * 26^0 + 24 * 26^1 + 18 * 26^2 + 8 * 26^3 + 19 * 26^4 + 24 * 26^5 + 6 * 26^6 = 2147483647



## 代码

```go

package leetcode

func titleToNumber(s string) int {
	val, res := 0, 0
	for i := 0; i < len(s); i++ {
		val = int(s[i] - 'A' + 1)
		res = res*26 + val
	}
	return res
}

```
