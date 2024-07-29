//
//  GraphDFS.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/28/24.
//

import Foundation

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
