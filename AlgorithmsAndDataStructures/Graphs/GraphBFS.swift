//
//  GraphBFS.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/28/24.
//

import Foundation

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
