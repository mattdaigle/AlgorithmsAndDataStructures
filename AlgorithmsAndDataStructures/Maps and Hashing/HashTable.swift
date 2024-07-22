//
//  HashTable.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/22/24.
//

import Foundation

class HashTable {

    var table: [[String]]

    init() {
        table = Array(repeating: [], count: 10000)
    }

    func store(_ input: String) {
        let index = hashValue(for: input)
        table[index].append(input)
    }

    func lookup(_ input: String) -> Bool {
        let index = hashValue(for: input)

        return table[index].contains(input)
    }

    private func hashValue(for input: String) -> Int {
        let firstAsciiValue = getAsciiValue(from: input, atIndex: 0)
        let secondAsciiValue = getAsciiValue(from: input, atIndex: 1)

        return 100 * firstAsciiValue + secondAsciiValue
    }

    private func getAsciiValue(from input: String, atIndex index: Int) -> Int {
        guard input.count > index, let asciiValue = input[input.index(input.startIndex, offsetBy: index)].asciiValue else {
            return 0
        }

        return Int(asciiValue)
    }
}
