# [496. Next Greater Element I](https://leetcode.com/problems/next-greater-element-i/)

## 题目

You are given two arrays (without duplicates) nums1 and nums2 where nums1’s elements are subset of nums2. Find all the next greater numbers for nums1's elements in the corresponding places of nums2.

The Next Greater Number of a number x in nums1 is the first greater number to its right in nums2. If it does not exist, output -1 for this number.


Example 1:

```c
Input: nums1 = [4,1,2], nums2 = [1,3,4,2].
Output: [-1,3,-1]
Explanation:
    For number 4 in the first array, you cannot find the next greater number for it in the second array, so output -1.
    For number 1 in the first array, the next greater number for it in the second array is 3.
    For number 2 in the first array, there is no next greater number for it in the second array, so output -1.
```

Example 2:

```c
Input: nums1 = [2,4], nums2 = [1,2,3,4].
Output: [3,-1]
Explanation:
    For number 2 in the first array, the next greater number for it in the second array is 3.
    For number 4 in the first array, there is no next greater number for it in the second array, so output -1.
```

Note:  

- All elements in nums1 and nums2 are unique.  
- The length of both nums1 and nums2 would not exceed 1000.


## 题目大意

这道题也是简单题。题目给出 2 个数组 A 和 B，针对 A 中的每个数组中的元素，要求在 B 数组中找出比 A 数组中元素大的数，B 中元素之间的顺序保持不变。如果找到了就输出这个值，如果找不到就输出 -1。


## 解题思路

简单题，依题意做即可。
解法二：单调栈
单调栈实际上就是栈，只是利用了一些巧妙的逻辑，使得每次新元素入栈后，栈内的元素都保持有序（单调递增或递减）

 当题目出现「找到最近一个比其大的元素」的字眼时，自然会想到「单调栈」。

 具体的，由于我们目标是找到某个数其在 nums2nums2 的右边中第一个比其大的数，因此我们可以对 nums2nums2 进行逆序遍历。

 我们在遍历 nums2nums2 时，实时维护一个单调栈，当我们遍历到元素 nums2[i]nums2[i] 时，可以先将栈顶中比 nums2[i]nums2[i] 小的元素出栈，最终结果有两种可能：

 栈为空，说明 nums2[i]nums2[i] 之前（右边）没有比其大的数；

 栈不为空， 此时栈顶元素为 nums2[i]nums2[i] 在 nums2nums2 中（右边）最近的比其大的数。

 再利用数组中数值各不相同，在遍历 nums2nums2 的同时，使用哈希表记录每个 nums2[i]nums2[i] 对应目标值是多少即可。

 补充：评论区较多同学说，不理解为什么「倒序遍历」，这里的「倒序遍历」是为了「正向解决问题」。
 由于我们找的是某个数右边第一个比其大的数，因此我们倒序遍历，可以确保需要找的数已经被处理过。
