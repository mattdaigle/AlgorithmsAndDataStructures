//
//  BinarySearchTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/22/24.
//

import Foundation

class BinarySearchTree {

    class Node {

        var value: Int
        var left: Node?
        var right: Node?

        init(value: Int) {
            self.value = value
        }
    }

    private var root: Node

    init(value: Int) {
        self.root = Node(value: value)
    }

    func search(for value: Int) -> Bool {
        recursiveSearch(root, for: value)
    }

    func insert(_ value: Int) {
        recursiveInsert(at: root, value: value)
    }

    private func recursiveSearch(_ current: Node?, for value: Int) -> Bool {
        guard let current else {
            return false
        }

        if value == current.value {
            return true
        } else if value < current.value {
            return recursiveSearch(current.left, for: value)
        } else {
            return recursiveSearch(current.right, for: value)
        }
    }

    private func recursiveInsert(at current: Node, value: Int) {
        if value > current.value {
            if let right = current.right {
                recursiveInsert(at: right, value: value)
            } else {
                current.right = Node(value: value)
            }
        } else {
            if let left = current.left {
                recursiveInsert(at: left, value: value)
            } else {
                current.left = Node(value: value)
            }
        }
    }
}
