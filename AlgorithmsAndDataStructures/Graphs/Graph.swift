//
//  Graph.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/28/24.
//

import Foundation

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
}
