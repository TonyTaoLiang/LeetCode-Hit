# [88. Merge Sorted Array](https://leetcode.com/problems/merge-sorted-array/description/)

## 题目

Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

Note:  

You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2. The number of elements initialized in nums1 and nums2 are m and n respectively.

## 题目大意

合并两个已经有序的数组，结果放在第一个数组中，第一个数组假设空间足够大。要求算法时间复杂度足够低。

## 解题思路

为了不大量移动元素，就要从2个数组长度之和的最后一个位置开始，依次选取两个数组中大的数，从第一个数组的尾巴开始往头放，只要循环一次以后，就生成了合并以后的数组了。(O(1)空间复杂度)

一种方法是类似归并排序的merge步骤从前往后双指针，之所以要使用临时变量，是因为如果直接合并到数组nums1中，nums1中的元素可能会在取出之前被覆盖。那么如何直接避免覆盖nums1中的元素呢？观察可知，nums1的后半部分是空的，可以直接覆盖而不会影响结果。因此可以指针设置为从后向前遍历，每次取两者之中的较大者放进nums1的最后面。（倒着遍历的方式有点类似动态规划使用一维数组代替二维数组为了防止上一层的数据被抹掉，倒着遍历）

严格来说，在此遍历过程中的任意一个时刻，nums1数组中有 m-p1-1 个元素被放入 nums1的后半部，nums2数组中有 n-p2-1个元素被放入 nums1的后半部，而在指针 p1的后面，nums1数组有 m+n-p1-1个位置。由于

m+n-p1-1 >= m-p1-1 + n-p2-1

等价于

p2  ≥ −1

永远成立，因此 p1后面的位置永远足够容纳被插入的元素，不会产生p1的元素被覆盖的情况。
