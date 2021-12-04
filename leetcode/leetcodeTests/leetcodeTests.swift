//
//  leetcodeTests.swift
//  leetcodeTests
//
//  Created by Tonytaoliang on 2021/11/28.
//

import XCTest
@testable import leetcode
//新创建了类，先command+B build一下
class leetcodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    //Input: 1->2->4, 1->3->4
//    Output: 1->1->2->3->4->4
    func testMergeTwoSortedLists() {

        let l1 = ListNode(1)
        l1.next = ListNode(2)
        l1.next?.next = ListNode(4)

        let l2 = ListNode(1)
        l2.next = ListNode(3)
        l2.next?.next = ListNode(4)

        let res = ListNode(1)
        let res1 = ListNode(1)
        let res2 = ListNode(2)
        let res3 = ListNode(3)
        let res4 = ListNode(4)
        let res5 = ListNode(4)

        res.next = res1
        res1.next = res2
        res2.next = res3
        res3.next = res4
        res4.next = res5

        let merge = MergeTwoSortedLists()
        XCTAssertEqual(merge.mergeTwoLists2(l1, l2)?.linkedListPrint(), res.linkedListPrint(), "MergeTwoSortedLists")

    }

    func testBinarySearch(){

        let binary = BinarySearch()

//        let nums = [1,2,3,4,5,6]
        let nums = [-1,0,3,5,9,12]
//        XCTAssertEqual(binary.search(nums, 6), 5, "二分查找")
//        XCTAssertEqual(binary.search(nums, 5), 4, "二分查找")
//        XCTAssertEqual(binary.search(nums, 4), 3, "二分查找")
//        XCTAssertEqual(binary.search(nums, 3), 2, "二分查找")
//        XCTAssertEqual(binary.search(nums, 2), 1, "二分查找")
//        XCTAssertEqual(binary.search(nums, 1), 0, "二分查找")
//        XCTAssertEqual(binary.search(nums, 7), 5, "二分查找")
        XCTAssertEqual(binary.search2(nums, 12), 5, "二分查找")
    }

    func testSearchInsertPosition(){

        let search = SearchInsertPosition()

//        let nums = [-1,0,3,5,9,12]
        let nums = [1,3,6]
        XCTAssertEqual(search.searchInsert(nums, 1), 0, "搜索插入位置")


    }

    func testTwoSumInput(){

        let two = TwoSumInputArray()
        let nums = [2,7,11,15]
        XCTAssertEqual(two.twoSum(nums, 9), [1,2], "2")
    }

    func testReverseWordsinStringIII() {

        let rever = ReverseWordsinStringIII()
        XCTAssert((rever.reverseWords("Let's take LeetCode contest") == "s'teL ekat edoCteeL tsetnoc"), "111")


    }
}
