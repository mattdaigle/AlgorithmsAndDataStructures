//
//  MergeSort.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/18/24.
//

import Foundation

func mergeSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }

    let midIndex = input.count / 2
    let left = Array(input[0..<midIndex])
    let right = Array(input[midIndex..<input.count])

    return merge(left: mergeSort(left), right: mergeSort(right))
}

private func merge(left: [Int], right: [Int]) -> [Int] {
    var result = [Int]()
    var leftIndex = 0
    var rightIndex = 0

    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            result.append(left[leftIndex])
            leftIndex += 1
        } else if left[leftIndex] > right[rightIndex] {
            result.append(right[rightIndex])
            rightIndex += 1
        } else {
            result.append(left[leftIndex])
            leftIndex += 1

            result.append(right[rightIndex])
            rightIndex += 1
        }
    }

    // Append any remaining values in case left and right are different sizes.
    result.append(contentsOf: left[leftIndex..<left.count])
    result.append(contentsOf: right[rightIndex..<right.count])

    return result
}
