//
//  Hanota.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/22.
//

import Foundation

class Hanota {

    /** 三部曲
     (1)以C盘为中介，从A杆将1至n-1号盘移至B杆；
     (2)将A杆中剩下的第n号盘移至C杆；
     (3)以A杆为中介；从B杆将1至n-1号盘移至C杆
     */
    func hanota(_ A: inout [Int], _ B: inout [Int], _ C: inout [Int]) {

        _hanota(A.count, &A, &B, &C)
        print(C)
    }

    private func _hanota(_ n: Int, _ A: inout [Int], _ B: inout [Int], _ C: inout [Int]){

        if n == 1 {
//            C.append(A.last!)
//            A.removeLast()
            C.append(A.removeLast())
            return
        }

        _hanota(n-1, &A, &C, &B)
//        C.append(A.last!)
//        A.removeLast()
        C.append(A.removeLast())
        _hanota(n-1, &B, &A, &C)


    }
}
