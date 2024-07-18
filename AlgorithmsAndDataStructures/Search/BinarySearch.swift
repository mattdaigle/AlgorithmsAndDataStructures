//
//  BinarySearch.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/15/24.
//

import Foundation

extension Array where Element.Type == Int.Type {
    
    func binarySearch(indexOf value: Int) -> Int? {
        var lowIndex = 0
        var highIndex = count - 1

        while lowIndex <= highIndex {
            let midIndex = (lowIndex + highIndex) / 2

            if value == self[midIndex] {
                return midIndex
            } else if value > self[midIndex] {
                lowIndex = midIndex + 1
            } else {
                highIndex = midIndex - 1
            }
        }

        return nil
    }
}
