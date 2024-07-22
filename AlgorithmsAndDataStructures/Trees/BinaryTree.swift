//
//  BinaryTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/22/24.
//

import Foundation

class BinaryTree {

    class Node {

        var value: Int
        var left: Node?
        var right: Node?

        init(value: Int) {
            self.value = value
        }
    }

    var root: Node

    init(rootValue: Int) {
        self.root = Node(value: rootValue)
    }

    // Return true if the value is in the tree, otherwise return false
    func search(for value: Int) -> Bool {
        preorderSearch(root, for: value)
    }

    // Return a string containing all tree nodes as they are visited in a pre-order traversal.
    func printTree() -> String {
        let string = preorderPrint(root, traverse: "") ?? ""

        return string.trimmingCharacters(in: ["-"])
    }

    // Helper method - use to create a recursive search solution.
    private func preorderSearch(_ node: Node?, for value: Int) -> Bool {
        guard let node else {
            return false
        }
        guard node.value == value else {
            return preorderSearch(node.left, for: value) || preorderSearch(node.right, for: value)
        }

        return true
    }

    // Helper method - use to construct a string representing the preordered nodes
    private func preorderPrint(_ node: Node?, traverse: String) -> String? {
        guard let node else {
            return traverse
        }

        var newTraverse = traverse + "\(node.value)-"

        if let leftValue = preorderPrint(node.left, traverse: newTraverse) {
            newTraverse = leftValue
        }
        if let rightValue = preorderPrint(node.right, traverse: newTraverse) {
            newTraverse = rightValue
        }

        return newTraverse
    }
}
