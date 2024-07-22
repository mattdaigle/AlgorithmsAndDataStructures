//
//  LinkedList.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/14/24.
//

import Foundation

class LinkedList {
    
    class Node {

        var value: Int
        var next: Node?

        init(value: Int) {
            self.value = value
        }
    }

    private var head: Node?

    init(head: Node? = nil) {
        self.head = head
    }

    func append(_ node: Node) {
        guard head != nil else {
            head = node
            return
        }

        var current = head

        while current?.next != nil {
            current = current?.next
        }
        current?.next = node
    }

    func getNode(atPosition position: Int) -> Node? {
        guard position > 0 else {
            return nil
        }

        var current = head

        for counter in 1...position {
            if counter == position || current == nil {
                break
            }

            current = current?.next
        }

        return current
    }

    func insert(_ node: Node, at position: Int) {
        guard position > 0 else {
            return
        }

        guard position > 1 else {
            node.next = head
            head = node
            return
        }

        var current = head

        for counter in 1..<position {
            if counter == position - 1 || current == nil {
                break
            }

            current = current?.next
        }

        node.next = current?.next
        current?.next = node
    }

    func deleteFirstNode(withValue value: Int) {
        var current = head
        var previous: Node?

        while current?.value != value && current?.next != nil {
            previous = current
            current = current?.next
        }

        guard current?.value == value else {
            return
        }

        if let previous {
            previous.next = current?.next
        } else {
            head = current?.next
        }
    }
}
