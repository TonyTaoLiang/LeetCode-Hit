# [350. Intersection of Two Arrays II](https://leetcode.com/problems/intersection-of-two-arrays-ii/)

## 题目

Given two arrays, write a function to compute their intersection.



Example 1:

```c
Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]
```

Example 2:

```c
Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
```

Note:

- Each element in the result should appear as many times as it shows in both arrays.
- The result can be in any order.


Follow up:

- What if the given array is already sorted? How would you optimize your algorithm?
- What if nums1's size is small compared to nums2's size? Which algorithm is better?
- What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

## 题目大意

这题是第 349 题的加强版。要求输出 2 个数组的交集元素，如果元素出现多次，要输出多次。

## 解题思路

- 解法一：双指针解决
先对两个数组进行排序，然后使用两个指针，分别指向两个数组开始的位置。

如果两个指针指向的值相同，说明这个值是他们的交集，就把这个值加入到集合list中，然后两个指针在分别往后移一步。
如果两个指针指向的值不同，那么指向的值相对小的往后移一步，相对大的先不动，然后再比较

- 解法二：Map
这一题还是延续第 349 题的思路。把数组一中的数字都放进字典中，另外字典的 key 是数组中的数字，value 是这个数字出现的次数。
遍历nums1中的所有元素，把它存放到map中，其中key就是nums1中的元素，value就是这个元素在数组nums1中出现的次数。

遍历nums2中的所有元素，查看map中是否包含nums2的元素，如果包含，就把当前值加入到集合list中，然后对应的value要减1。



