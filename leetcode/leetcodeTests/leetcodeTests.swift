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
        XCTAssert((rever.reverseWords2("Let's take LeetCode contest") == "s'teL ekat edoCteeL tsetnoc"), "111")


    }

    func testFloodFill(){

        let flood = FloodFill()
        flood.floodFill([[0,0,0],[0,1,1]], 1, 1, 1)

    }

    func testMatrix(){

        let ma = Matrix()

        let array = [[1,1,0,0,1,0,0,1,1,0],[1,0,0,1,0,1,1,1,1,1],[1,1,1,0,0,1,1,1,1,0],[0,1,1,1,0,1,1,1,1,1],[0,0,1,1,1,1,1,1,1,0],[1,1,1,1,1,1,0,1,1,1],[0,1,1,1,1,1,1,0,0,1],[1,1,1,1,1,0,0,1,1,1],[0,1,0,1,1,0,1,1,1,1],[1,1,1,0,1,0,1,1,1,1]]

        let res = ma.updateMatrix(array)

        print(res)

    }

    func testRottingOrange(){

        let orange = RottingOranges()

        let array = [[2,0,1,1,1,1,1,1,1,1],[1,0,1,0,0,0,0,0,0,1],[1,0,1,0,1,1,1,1,0,1],[1,0,1,0,1,0,0,1,0,1],[1,0,1,0,1,0,0,1,0,1],[1,0,1,0,1,1,0,1,0,1],[1,0,1,0,0,0,0,1,0,1],[1,0,1,1,1,1,1,1,0,1],[1,0,0,0,0,0,0,0,0,1],[1,1,1,1,1,1,1,1,1,1]]

        let res = orange.orangesRotting(array)
    }

    func testCombine(){

        let com = Combination()
        com.combine(4, 2)

    }
    func testLetter(){

        let letter = LetterPermutation()
        letter.letterCasePermutation("aa")
    }
    func testClimb(){

        let climb = ClimbingStairs()
        climb.climbStairs(1)

    }

    func testTriangle() {

        let tri = Triangle()
        var array = [[-1],[9,-2],[0,4,5],[7,4,-4,-5],[9,6,0,5,7],[9,2,-9,-4,5,-2],[-4,-9,-5,-7,-5,-5,-2],[-9,5,-6,-4,4,1,6,-4],[-4,3,9,-2,8,6,-9,-2,-2]]
//        tri.minimumTotal([[-1],[2,3],[1,-1,-3],[-100,1,2,1]])
        tri.minimumTotal(array)
        tri.minimumTotal4(array)
    }

    func testMaxDepthofBinaryTree(){

        let de = MaxDepthofBinaryTree()
        let tree1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
        de.maxDepth(tree1)

    }

    func testNumbersOfIsland(){

        let island = NumbersOfIsland()
        let aa: Character = "a"
        let grid = [
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
        ]

        let grid2 = [
          ["1","1","0","0","0"],
          ["1","1","0","0","0"],
          ["0","0","1","0","0"],
          ["0","0","0","1","1"]
        ]

        let grid3 = [["1","0","1"],
                     ["0","1","0"],
                     ["1","0","1"]]
        island.numIslands(grid3)
        island.numIslands2(grid3)
    }

    func testHanota() {

        let h = Hanota()
        var a: [Int] = [2,1,0]
        var b: [Int] = [Int]()
        var c: [Int] = [Int]()

        h.hanota(&a, &b, &c)

    }

    func testKthTree() {
//            3
//        1      4
//          2
        let root = TreeNode(3, TreeNode(1, nil, TreeNode(2)), TreeNode(4))
        let k = KthSmallestBST()
//        k.kthSmallest(root, 1)
//        k.kthSmallest(root, 2)
        k.kthSmallest(root, 3)
//        k.kthSmallest(root, 4)
    }

    func testMaxPathTree() {

//        -10
//        / \
//       9  20
//         /  \
//        15   7

        let root = TreeNode(-10, TreeNode(9) , TreeNode(20, TreeNode(15), TreeNode(7)))
//        let root = TreeNode(3, TreeNode(1, nil, TreeNode(2)), TreeNode(4))
        let m = MaxPathBinaryTree()
        m.maxPathSum(root)

    }


    func testConvertTree() {

        let tree = ConvertSortedArrayToBST()
        let array = [0,1,2,3,4,5]
        tree.sortedArrayToBST(array)

    }

    func testAncestorBT() {

        let AncestorBT = CommonAncestorBT()
        let root = TreeNode(-10, TreeNode(9) , TreeNode(20, TreeNode(15), TreeNode(7)))
        AncestorBT.lowestCommonAncestor2(root, TreeNode(9), TreeNode(7))

    }

    func testSurroundedRegions(){

        let SurroundedRegions = SurroundedRegions()
        var a = [["O","O","O"],["O","O","O"],["O","O","O"]]
        SurroundedRegions.solve2(&a)

    }

    func testPow() {

        let p = Powxn()
        p.myPow(0.00001, 2147483647)
    }

    func testcoinChange() {

        let coin = CoinChange()
        coin.coinChange([2], 3)
    }
}
