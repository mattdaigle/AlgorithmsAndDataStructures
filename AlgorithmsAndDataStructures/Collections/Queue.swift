//
//  Queue.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/15/24.
//

import Foundation

class Queue {

    private var storage: [Int]

    init(head: Int) {
        storage = [head]
    }

    func enqueue(_ element: Int) {
        storage.append(element)
    }

    func peek() -> Int? {
        storage.first
    }

    func dequeue() -> Int? {
        guard !storage.isEmpty else {
            return nil
        }

        return storage.removeFirst()
    }
}
