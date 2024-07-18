//
//  Fibonacci.swift
//  AlgorithmsAndDataStructures
//
//  Created by Matt Daigle on 7/15/24.
//

import Foundation

func getFib(_ position: Int) -> Int {
    if position == 0 || position == 1 {
        return position
    }

    return getFib(position - 1) + getFib(position - 2)
}
