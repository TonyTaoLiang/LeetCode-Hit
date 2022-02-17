# [503. Next Greater Element II](https://leetcode.com/problems/next-greater-element-ii/)

## 题目

Given a circular array (the next element of the last element is the first element of the array), print the Next Greater Number for every element. The Next Greater Number of a number x is the first greater number to its traversing-order next in the array, which means you could search circularly to find its next greater number. If it doesn't exist, output -1 for this number.

Example 1:

```c
Input: [1,2,1]
Output: [2,-1,2]
Explanation: The first 1's next greater number is 2; 
The number 2 can't find next greater number; 
The second 1's next greater number needs to search circularly, which is also 2.
```

Note: The length of given array won't exceed 10000.

## 题目大意

题目给出数组 A，针对 A 中的每个数组中的元素，要求在 A 数组中找出比该元素大的数，A 是一个循环数组。如果找到了就输出这个值，如果找不到就输出 -1。


## 解题思路

这题是第 496 题的加强版，在第 496 题的基础上增加了循环数组的条件。这一题可以依旧按照第 496 题的做法继续模拟。更好的做法是用单调栈，栈中记录单调递增的下标。


本题如果暴力求解，对于每个元素都向后去寻找比它更大的元素，那么时间复杂度 O(N^2)会超时。必须想办法优化。

我们注意到，暴力解法中，如果数组的前半部分是单调不增的，那么会有很大的计算资源的浪费。比如说 [6,5,4,3,8]，对于前面的 [6,5,4,3] 等数字都需要向后遍历，当寻找到元素 8 时才找到了比自己大的元素；而如果已知元素 6 向后找到元素 8 才找到了比自己的大的数字，那么对于元素 [5,4,3] 来说，它们都比元素 6 更小，所以比它们更大的元素一定是元素 8，不需要单独遍历对 [5,4,3] 向后遍历一次！

根据上面的分析可知，可以遍历一次数组，如果元素是单调递减的（则他们的「下一个更大元素」相同），我们就把这些元素保存，直到找到一个较大的元素；把该较大元素逐一跟保存了的元素比较，如果该元素更大，那么它就是前面元素的「下一个更大元素」。

在实现上，我们可以使用「单调栈」来实现，单调栈是说栈里面的元素从栈底到栈顶是单调递增或者单调递减的（类似于汉诺塔）。

本题应该用个「单调递减栈」来实现。

建立「单调递减栈」，并对原数组遍历一次：

如果栈为空，则把当前元素放入栈内；
如果栈不为空，则需要判断当前元素和栈顶元素的大小：
如果当前元素比栈顶元素大：说明当前元素是前面一些元素的「下一个更大元素」，则逐个弹出栈顶元素，直到当前元素比栈顶元素小为止。
如果当前元素比栈顶元素小：说明当前元素的「下一个更大元素」与栈顶元素相同，则把当前元素入栈。

