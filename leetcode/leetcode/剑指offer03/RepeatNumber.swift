//
//  RepeatNumber.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/7/13.
//

import Foundation

class RepeatNumber {

    func findRepeatNumber(_ nums: [Int]) -> Int {

        var array = nums


        for (i,num) in array.enumerated() {

            while num != i {

                if num == array[num] {
                    return num
                }

                array.swapAt(i, num)
            }


        }

        return -1
    }

    //MARK: - 数组关于03的延伸要求空间复杂度是O(1)
    //如果要求空间复杂度是O(1),不能如上var arr = nums。怎么办？用二分查找 如果1～n在数组中出现的次数超过了n次则表明有重复的
    //如：[2,3,5,4,3,2,6,7] 分为1~4，5～7(长度是8). 而1～4这4个数字在数组中出现了5次(2,3,4,3,2)则说明有重复的
    public func findRepeatNumberBinary(_ nums: [Int]) -> Int {

        //如果是书中所说：长度n+1 。范围 1～n。start和end如下
        var start = 1
        var end = nums.count - 1
        //MARK: - 如果是leecode：长度n+1 。范围 0～n。start和end如下 这个不太适用这个算法
//        var start = 0
//        var end = nums.count - 1
        while start <= end {

            let middle = (end - start) / 2 + start
            //前面范围在数组中出现的次数
            let count = countRange(nums, start, middle)

            //终止条件 分组中只有一个元素
            if end == start {

                if count > 1 {
                    //最后剩2个数 如果是前一个就是start 是后一个也是start 因为下面start = middle + 1
                    return start
                }else{
                    //没有重复
                    break
                }
            }

            if count > (middle - start + 1) {
                //middle前面的分组有重复 前面继续二分
                end = middle
            } else {

                //middle后面的分组有重复 后面继续二分
                start = middle + 1
            }

        }

        return -1

    }

    func countRange(_ nums: [Int], _ start: Int, _ end: Int) -> Int {

        var count = 0

        for num in nums {

            if num >= start && num <= end {
                count += 1
            }

        }
        return count
    }

}
