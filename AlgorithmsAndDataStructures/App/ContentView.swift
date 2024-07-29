//
//  ContentView.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/14/24.
//

import SwiftUI

struct ContentView: View {
    enum Sections: String, CaseIterable {
        case collections
        case searching
        case sorting
        case hashing
        case trees
        case graphs
        case recursion

        var title: String {
            rawValue.capitalized
        }

        var cells: [Cell] {
            switch self {
            case .collections:
                [
                    Cell(title: "Linked List", code: linkedListCode),
                    Cell(title: "Stack", code: stackCode),
                    Cell(title: "Queue", code: queueCode)
                ]
            case .searching:
                [Cell(title: "Binary Search", code: binarySearchCode)]
            case .sorting:
                [
                    Cell(title: "Quick Sort", code: quickSortCode),
                    Cell(title: "Merge Sort", code: mergeSortCode)
                ]
            case .hashing:
                [Cell(title: "Hash Table", code: hashTableCode)]
            case .trees:
                [
                    Cell(title: "Binary Tree", code: binaryTreeCode),
                    Cell(title: "Binary Search Tree", code: binarySearchTreeCode)
                ]
            case .graphs:
                [
                    Cell(title: "Graph", code: graphCode),
                    Cell(title: "Graph BFS", code: graphBFSCode),
                    Cell(title: "Graph DFS", code: graphDFSCode),
                    Cell(title: "Graph Representation", code: graphRepresentationCode)
                ]
            case .recursion:
                [Cell(title: "Fibonacci", code: fibonacciCode)]
            }
        }
    }

    struct Cell: Hashable {
        var title: String
        var code: String
    }

    var body: some View {
        NavigationStack() {
            List {
                ForEach(Sections.allCases, id: \.self) { section in
                    Section(section.title) {
                        ForEach(section.cells, id: \.self) { cell in
                            NavigationLink(cell.title, value: cell)
                        }
                    }
                }
            }
            .navigationDestination(for: Cell.self) {
                CodeDetailsView(code: $0.code)
                    .navigationTitle($0.title)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
