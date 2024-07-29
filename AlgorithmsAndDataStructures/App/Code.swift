//
//  Code.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/27/24.
//

import Foundation

let linkedListCode = """
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
"""

let stackCode = """
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
"""

let queueCode = """
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
"""

let binarySearchCode = """
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
"""

let quickSortCode = """
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
"""

let mergeSortCode = """
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
"""

let hashTableCode = """
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
"""

let binaryTreeCode = """
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

    // Return true if the value is in the tree, otherwise return false.
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

    // Helper method - use to construct a string representing the preordered nodes.
    private func preorderPrint(_ node: Node?, traverse: String) -> String? {
        guard let node else {
            return traverse
        }

        var newTraverse = traverse + "\\(node.value)-"

        if let leftValue = preorderPrint(node.left, traverse: newTraverse) {
            newTraverse = leftValue
        }
        if let rightValue = preorderPrint(node.right, traverse: newTraverse) {
            newTraverse = rightValue
        }

        return newTraverse
    }
}
"""

let binarySearchTreeCode = """
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
"""

let graphCode = """
class Graph {

    class Node {
        var value: Int
        var edges = [Edge]()
        var visited = false

        init(value: Int) {
            self.value = value
        }
    }

    class Edge {
        var value: Int
        var fromNode: Node
        var toNode: Node

        init(value: Int, fromNode: Node, toNode: Node) {
            self.value = value
            self.fromNode = fromNode
            self.toNode = toNode
        }
    }

    var nodes: [Node]
    var edges: [Edge]

    init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }

    func insertNodeWithValue(_ value: Int) {
        let newNode = Node(value: value)
        nodes.append(newNode)
    }

    func insertEdgeWithValue(_ newEdgeValue: Int, fromNodeValue: Int, toNodeValue: Int) {
        var fromFound: Node!
        var toFound: Node!

        for node in nodes {
            if fromNodeValue == node.value {
                fromFound = node
            }
            if toNodeValue == node.value {
                toFound = node
            }
        }

        if fromFound == nil {
            let node = Node(value: fromNodeValue)
            nodes.append(node)
            fromFound = node
        }
        if toFound == nil {
            let node = Node(value: toNodeValue)
            nodes.append(node)
            toFound = node
        }

        let newEdge = Edge(value: newEdgeValue, fromNode: fromFound, toNode: toFound)
        fromFound.edges.append(newEdge)
        toFound.edges.append(newEdge)
        edges.append(newEdge)
    }
"""

let graphBFSCode = """
extension Graph {

    func bfs(_ startNode: Node) -> [Int] {
        var visited: [Int] = []
        var toVisit: [Node] = [] // Treat this array as a queue

        toVisit.append(startNode)
        visited.append(startNode.value)
        startNode.visited = true

        while !toVisit.isEmpty {
            let node = toVisit.removeFirst()

            for edge in node.edges {
                let neighborNode = edge.toNode

                if !neighborNode.visited {
                    toVisit.append(neighborNode)
                    neighborNode.visited = true
                    visited.append(neighborNode.value)
                }
            }
        }

        return visited
    }
}
"""

let graphDFSCode = """
extension Graph {

    func dfs(_ startNode: Node) -> [Int] {
        let visited = [startNode.value]

        return dfsHelper(startNode, visited: visited)
    }

    private func dfsHelper(_ current: Node, visited: [Int]) -> [Int] {
        var result = visited

        for edge in current.edges {
            if !result.contains(edge.toNode.value) {
                result.append(edge.toNode.value)
                result = dfsHelper(edge.toNode, visited: result)
            }
        }

        return result
    }
}
"""

let graphRepresentationCode = """
extension Graph {

    func getMaxIndex() -> Int {
        var maxIndex = 0

        for node in nodes {
            if node.value > maxIndex {
                maxIndex = node.value
            }
        }

        return maxIndex
    }

    func getEdgeList() -> [[Int]] {
        var edgeList = [[Int]]()

        for edge in edges {
            let listEdge = [edge.value, edge.fromNode.value, edge.toNode.value]
            edgeList.append(listEdge)
        }

        return edgeList
    }

    func getAdjacencyList() -> [[[Int]]] {
        let max = getMaxIndex()
        var list = Array(repeating: [[Int]](), count: max)

        for edge in edges {
            if !list[edge.fromNode.value].isEmpty {
                list[edge.fromNode.value].append([edge.toNode.value, edge.value])
            } else {
                list[edge.fromNode.value] = [[edge.toNode.value, edge.value]]
            }
        }

        return list
    }

    func getAdjacencyMatrix() -> [[Int]] {
        let max = getMaxIndex()
        let zeroArray = Array(repeating: 0, count: max)
        var matrix = Array(repeating: zeroArray, count: max)

        for edge in edges {
            matrix[edge.fromNode.value][edge.toNode.value] = edge.value
        }

        return matrix
    }
}
"""

let fibonacciCode = """
func getFib(_ position: Int) -> Int {
    if position == 0 || position == 1 {
        return position
    }

    return getFib(position - 1) + getFib(position - 2)
}
"""
