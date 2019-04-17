//
//  BubbleBuilder.swift
//  AnimalFarm
//
//  Created by Liam Rosenfeld on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

internal class BubbleBuilder {
    let topChar: Character
    let btmChar: Character
    let leftChar: Character
    let rightChar: Character
    let maxSignWidth = 35
    
    func build(with message: [String]) -> String {
        guard !message.isEmpty else {
            return ""
        }
        let message = auditMessage(message)
        return buildSign(with: message)
    }
    
    func auditMessage(_ message: [String]) -> [String] {
        for word in message {
            if (word.count > (maxSignWidth - 3)) {
                let returnMessage =  "One of your words are too long".components(separatedBy: .newlines)
                return returnMessage
            }
        }
        
        return message
    }
    
    func createLines(with message: [String]) -> [String] {
        var lines = [String]()
        
        var line = ""
        for word in message {
            if word.contains("```") {
                continue
            }
            
            if line.count + word.count > maxSignWidth - 3 {
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
    
    func buildSign(with lines: [String]) -> String {
        // Get Longest Length
        var longest = 9
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
        return "\(leftChar)\(dashes)\(rightChar)"
    }
    
    init(_ style: SpeechBubble) {
        self.topChar   = style.top
        self.btmChar   = style.btm
        self.leftChar  = style.left
        self.rightChar = style.right
    }
}
