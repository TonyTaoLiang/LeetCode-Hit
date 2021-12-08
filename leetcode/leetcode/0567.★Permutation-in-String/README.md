# [567. Permutation in String](https://leetcode.com/problems/permutation-in-string/)

## 题目

Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.


Example 1:

```c
Input:s1 = "ab" s2 = "eidbaooo"
Output:True
Explanation: s2 contains one permutation of s1 ("ba").
```

Example 2:

```c
Input:s1= "ab" s2 = "eidboaoo"
Output: False
```

Note:

1. The input strings only contain lower case letters.
2. The length of both given strings is in range [1, 10,000].

## 题目大意


在一个字符串中寻找子串出现的位置。子串可以是 Anagrams 形式存在的。Anagrams 是一个字符串任意字符的全排列组合。

## 解题思路

解法一：滑动窗口（比较好理解）
自己的思路老是想考虑排列的顺序导致最后都混乱了。其实关键点在于：
1.由于排列不会改变字符串中每个字符的个数，所以只有当两个字符串每个字符的个数均相等时，一个字符串才是另一个字符串的排列。
2.因为字符串中只有小写字母 小写字母在ASCII表表中 是从97到122的26个字符 声明一个int temp[26]
第一个字符a也即temp[0] == temp['a'-97] 即 随便一个小写字母 temp[s[i]-97] == temp[s[i]-'a']。
因此创建2个26个元素的数组，每个字符的值是其出现的个数。最后判断2个数组在每个位置的值都相等则找到。
3.不断地滑动这个长度为n的窗口。

解法二：双指针

一句话总结：right指针不停扩充，保证区间 [left,right]里每个元素的个数都不会超出s1每个元素的个数。如果超出了，就移动left指针直到将此重复次数过多的元素移出区间。每次移动判断下区间长度，在right到达终点s2的末尾时或之前，如果正好区间 [left,right]的长度为n，则说明找到目标解。因为此时长度和s1相等，而此区间内的每一个元素都没重复过多，那么只有一种情况元素的个数都一一匹配了。（保证目标解需要2个因素cnt[x]≤0 && length == n）

回顾方法一的思路，我们在保证区间长度为n的情况下，去考察是否存在一个区间使得 cnt 的值全为0。

反过来，还可以在保证 cnt 的值不为正的情况下
(这是为了保证s2当前区间某个元素的个数不会超过s1此元素的个数)，去考察是否存在一个区间，其长度恰好为n。

初始时，仅统计s1中的字符，则cnt 的值均不为正，且元素值之和为−n。

然后用两个指针 left 和 right 表示考察的区间 [left,right]。right 每向右移动一次，就统计一次进入区间的字符 x（+1）。为保证 cnt 的值不为正，若此时 cnt[x]>0（此时说明区间内x出现的次数超出了s1中x的次数），则向右移动左指针，减少离开区间的字符的 cnt 值直到 cnt[x]≤0 （直到多余的x移出区间，类似第3题滑动窗口，将重复的字符移出去）。

注意到[left,right] 的长度每增加 1，cnt 的元素值之和就增加 1。当 [left,right] 的长度恰好为 n 时，就意味着 cnt 的元素值之和为 0。由于 cnt 的值不为正，元素值之和为 0 就意味着所有元素均为 0，这样我们就找到了一个目标子串。


这一题和第 438 题，第 3 题，第 76 题，第 567 题类似，用的思想都是"滑动窗口"。
这道题只需要判断是否存在，而不需要输出子串所在的下标起始位置。所以这道题是第 438 题的缩水版。具体解题思路见第 438 题。






