//
//  BubbleBuilder.swift
//  AnimalFarm
//
//  Created by Liam Rosenfeld on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

internal class BubbleBuilder {
    // Bubble Characters
    let topChar: Character
    let btmChar: Character
    let leftChar: Character
    let rightChar: Character
    let topSides: Bool

    // Bubble Dimensions
    let maxSignWidth = 32
    let minSignWidth = 9
    var recSignWidth = 15 // Recommended Width

    // Building
    func build(with lines: [String]) -> String {
        guard !lines.isEmpty else {
            return ""
        }

        // Get Longest Length
        var longest = minSignWidth
        for line in lines {
            if line.count > longest {
                longest = line.count
            }
        }
        
        // Build
        var boundary = buildSignBoundary(length: longest + 2, char: topChar)
        var sign = boundary + "\n"
        for line in lines {
            let endBuffer = String(repeating: " ", count: longest - (line.count))
            let full = "\(leftChar) \(line.uppercased())\(endBuffer) \(rightChar)\n"
            sign.append(full)
        }
        boundary = buildSignBoundary(length: longest + 2, char: btmChar)
        sign.append(boundary)
        return sign
    }
    
    func buildSignBoundary(length: Int, char: Character) -> String {
        let dashes = String(repeating: char, count: length)
        if topSides {
            return "\(leftChar)\(dashes)\(rightChar)"
        } else {
            return " \(dashes) "
        }

    }

    // Line Splitting
    func createLines(with message: [String]) -> [String] {
        let message = checkLength(message)
        var lines = [String]()

        var line = ""
        for word in message {
            if word.contains("```") {
                continue
            }

            if line.count + word.count > recSignWidth {
                lines.append(line)
                line = String(word)
            } else if line == "" {
                line = String(word)
            } else {
                line += " " + word
            }
        }
        if line != "" {
            lines.append(line)
        }

        return lines
    }

    func checkLength(_ message: [String]) -> [String] {
        for word in message {
            let count = word.count
            // Check None Longer Than Max
            guard count <= maxSignWidth else {
                let returnMessage =  "One of your words are too long".components(separatedBy: .whitespaces)
                return returnMessage
            }
            // Set Recommended Width To Longest Term if Larger
            if count > recSignWidth {
                recSignWidth = count
            }
        }

        return message
    }

    // Initializer
    init(_ style: Bubble) {
        self.topChar   = style.top
        self.btmChar   = style.btm
        self.leftChar  = style.left
        self.rightChar = style.right
        self.topSides  = style.topSides
    }
}
