//
//  Minimum Window Substring.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 10/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Minimum_Window_Substring: Executable {
    func excecute() {
        print(minWindow("ADOBECODEBANC", "ABC"))
    }

    func minWindow(_ s: String, _ t: String) -> String {
        let patternSize = t.count
        let stringSize = s.count
        guard patternSize <= stringSize else { return "" }
        var leftIndex = 0
        var range: ClosedRange<Int>?
        var count = 0
        var minimum = Int.max
        var hashMap = [Character : Int]()

        for char in t {
            hashMap[char, default: 0] += 1
        }

        let s = Array(s)
        for rightIndex in 0..<stringSize {

            hashMap[s[rightIndex], default: 0] -= 1
            if hashMap[s[rightIndex], default: 0] >= 0 {
                count += 1
            }

            while count == patternSize {

                if (rightIndex - leftIndex + 1) < minimum {
                    minimum = rightIndex - leftIndex + 1
                    range = leftIndex...rightIndex
                }

                let head = s[leftIndex]
                hashMap[head]! += 1
                if hashMap[head]! > 0 {
                    count -= 1
                }
                leftIndex += 1
            }
        }

        return range == nil ? "" : String(s[range!])
    }

}
