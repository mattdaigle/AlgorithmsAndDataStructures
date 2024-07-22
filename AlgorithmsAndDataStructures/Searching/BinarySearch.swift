//
//  BinarySearch.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/15/24.
//

import Foundation

func binarySearch(_ input: [Int], indexOf value: Int) -> Int? {
    var lowIndex = 0
    var highIndex = input.count - 1

    while lowIndex <= highIndex {
        let midIndex = (lowIndex + highIndex) / 2

        if value == input[midIndex] {
            return midIndex
        } else if value > input[midIndex] {
            lowIndex = midIndex + 1
        } else {
            highIndex = midIndex - 1
        }
    }

    return nil
}
