//
//  GraphRepresentation.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/28/24.
//

import Foundation

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
