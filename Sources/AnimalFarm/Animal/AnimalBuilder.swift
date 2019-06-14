//
//  AnimalBuilder.swift
//  AnimalFarm
//
//  Created by Liam Rosenfeld on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

internal struct AnimalBuilder {
    static func addLine(of lineChar: String, to art: String) -> String {
        guard lineChar != "" else {
            return art
        }

        // Shared
        var lines = art.components(separatedBy: .newlines)
        let index = Array(lines[1]).firstIndex { $0 != " "} ?? 0

        // Bottom Padding
        var numPadding = index - 3
        var padding = ""
        if numPadding < 0 {
            numPadding = abs(numPadding)
            padding = String(repeating: " ", count: numPadding)
        }
        for i in 2..<lines.count {
            lines[i] = padding + lines[i]
        }

        // Line
        let (_, firstContent) = split(string: lines[0], at: index)
        let (secondSpaces, secondContent) = split(string: lines[1], at: index)
        lines[0] = "\(lineChar)  " + firstContent
        lines[1] = " \(lineChar) " + secondContent

        // Top Padding
        padding = ""
        if numPadding != 0 && secondSpaces.count != 0 {
            numPadding = secondSpaces.count - numPadding - 1
            if numPadding > 0 {
                padding = String(repeating: " ", count: numPadding)
            }
        }
        for i in 0..<2 {
            lines[i] = padding + lines[i]
        }

        return lines.joined(separator: "\n")
    }
    
    static func split(string: String, at index: Int) -> (Substring, Substring) {
        let strIndex = string.index(string.startIndex, offsetBy: index)
        let before   = string[..<strIndex]
        let after    = string[strIndex...]
        return (before, after)
    }
}
