//
//  Stack.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/14/24.
//

import Foundation

class Stack {

    var linkedList: LinkedList

    init(top: LinkedList.Node?) {
        linkedList = LinkedList(head: top)
    }

    func push(_ node: LinkedList.Node) {
        linkedList.insert(node, at: 1)
    }

    func pop() -> LinkedList.Node? {
        guard let node = linkedList.getNode(atPosition: 1) else {
            return nil
        }

        linkedList.deleteFirstNode(withValue: node.value)

        return node
    }
}
