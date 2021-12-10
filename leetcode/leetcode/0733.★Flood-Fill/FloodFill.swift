//
//  FloodFill.swift
//  leetcode
//
//  Created by Tonytaoliang on 2021/12/10.
//

import Foundation

class FloodFill{
    //深度优先DFS 就不使用广度优先BFS的队列了
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {

        var newImage = image

        //关键在这一句，如果初始值和新颜色一样直接返回
        //不然会无限递归。
        /**
         if sr < 0 || sr > image.count - 1 || sc < 0 || sc > image[0].count - 1 || image[sr][sc] != oldColor {
             return
         }
         因为初始值如果和新颜色不一样，第一次不会进入return，而修改后，再进去判断image[sr][sc] != oldColor就会return有了出口

         而初始值如果和新颜色一样的话，始终image[sr][sc] == oldColor就不会进去return就没了出口
         */
//        if  image[sr][sc] == newColor{
//            return image
//        }
        recurseFill2(&newImage, sr, sc, newColor, image[sr][sc])
        return newImage

    }

    //这是题解的写法
    func recurseFill2(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int , _ oldColor: Int) {

        if image[sr][sc] == oldColor {
            image[sr][sc] = newColor
        }

        if sr >= 1 {
            recurseFill2(&image, sr - 1, sc, newColor, oldColor)
        }

        if sr + 1 < image.count{
            recurseFill2(&image, sr + 1, sc, newColor, oldColor)
        }

        if sc >= 1 {
            recurseFill2(&image, sr, sc - 1, newColor, oldColor)
        }

        if sc + 1 < image[0].count {
            recurseFill2(&image, sr, sc + 1, newColor, oldColor)
        }

    }

    //这是自己的写法，也是可以的，一样的意思
    func recurseFill(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int , _ oldColor: Int) {


        if sr < 0 || sr > image.count - 1 || sc < 0 || sc > image[0].count - 1 || image[sr][sc] != oldColor {
            return
        }

        if image[sr][sc] == oldColor {
            image[sr][sc] = newColor
        }

        recurseFill(&image, sr - 1, sc, newColor, oldColor)

        recurseFill(&image, sr + 1, sc, newColor, oldColor)

        recurseFill(&image, sr, sc - 1, newColor, oldColor)

        recurseFill(&image, sr, sc + 1, newColor, oldColor)

    }
}
