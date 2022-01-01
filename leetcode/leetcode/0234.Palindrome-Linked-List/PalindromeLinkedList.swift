//
//  PalindromeLinkedList.swift
//  leetcode
//
//  Created by Tonytaoliang on 2022/1/1.
//

import Foundation

class PalindromeLinkedList {

    //解法一：存入一个数组，再比较
    func isPalindrome(_ head: ListNode?) -> Bool {

        var array = [Int]()
        var temp = head

        while temp != nil {
            array.append(temp!.val)
            temp = temp?.next
        }

        var i = 0
        var j = array.count - 1

        while i < j {

            if array[i] == array[j] {
                i += 1
                j -= 1
            } else {
                return false
            }

        }

        return true
    }


    //解法二：快慢指针 反转链表
    func isPalindrome2(_ head: ListNode?) -> Bool {

        if head?.next == nil {
            return true
        }

        //找到中点
        var slow = head
        var fast = head

        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next

        }

        // 反转链表后半部分 参考206题
        let secondHalf = reverseList(slow?.next)


        //判断是否是回文串
        var startOne = head
        var startSecond = secondHalf

        while startSecond != nil {

            if startOne?.val != startSecond?.val {
                //恢复链表（再次反转）
                slow?.next = reverseList(secondHalf)
                return false
            }

            startOne = startOne?.next
            startSecond = startSecond?.next

        }

        //恢复链表（再次反转）
        slow?.next = reverseList(secondHalf)
        return true
    }

    func reverseList(_ head: ListNode?) -> ListNode? {

        var behind: ListNode?
        var front = head

        while front != nil {

            let temp = front
            front = front?.next
            temp?.next = behind
            behind = temp

        }
        return behind
    }


    //解法三：自己的递归解法，依次判断头尾，但是时间复杂度太高了
    func isPalindrome3(_ head: ListNode?) -> Bool {

        if head?.next == nil {
            return true
        }

        return _isPalindrome(head, nil)
    }

    func _isPalindrome(_ left: ListNode?, _ right: ListNode?) -> Bool {

        if left === right || left?.next === right {
            return true
        }


        var temp = left

        //这个时间复杂度太高了
        while temp?.next !== right {

            temp = temp?.next

        }


        if left?.val == temp?.val {

           return _isPalindrome(left?.next, temp)

        }

        return false
    }

}

