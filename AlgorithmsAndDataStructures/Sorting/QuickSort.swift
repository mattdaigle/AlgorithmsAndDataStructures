//
//  QuickSort.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/18/24.
//

import Foundation

func quickSort(_ input: [Int]) -> [Int] {
    quickSort(input, lowIndex: 0, highIndex: input.count - 1)
}

private func quickSort(_ input: [Int], lowIndex: Int, highIndex: Int) -> [Int] {
    guard lowIndex < highIndex else {
        return input
    }

    var result = input
    let pivot = result[highIndex]
    var i = lowIndex

    for j in lowIndex..<highIndex {
        if result[j] <= pivot {
            result.swapAt(i, j)
            i += 1
        }
    }

    result.swapAt(i, highIndex)
    result = quickSort(result, lowIndex: lowIndex, highIndex: i - 1)
    result = quickSort(result, lowIndex: i + 1, highIndex: highIndex)

    return result
}
