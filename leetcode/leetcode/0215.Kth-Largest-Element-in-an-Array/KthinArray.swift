//
//  KthinArray.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/2/8.
//

import Foundation

class KthinArray {

    //解法一：排序反而是最快的
    //Complexity: O(*n* log *n*), where *n* is the length of the sequence
    func findKthLargest1(_ nums: [Int], _ k: Int) -> Int {

        return nums.sorted()[nums.count-k]

    }

    //解法二：参考快排，每一次的partition都会放在“中间位”，比较partition和nums.count-k

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {

        var array = nums
        var low = 0
        var high = nums.count - 1

        //先定义low high变量，while取代递归操作
        while true {

            let index = partition(&array, low, high)
            if index == array.count - k {
                return array[index]
            } else if (index < array.count - k){
                //注意边界
                low = index + 1
            } else {
                //注意边界
                high = index - 1
            }
        }

    }

    func partition(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {

        let pivot = nums[high]

        var i = low

        for j in low..<high {

            if nums[j] <= pivot {

                nums.swapAt(i, j)
                i += 1

            }

        }

        nums.swapAt(i, high)

        return i
    }
}
