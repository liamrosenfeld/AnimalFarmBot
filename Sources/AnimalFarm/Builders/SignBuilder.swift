//
//  SignBuilder.swift
//  AnimalFarm
//
//  Created by Liam on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

class SignBuilder {
    static let topChar = "-"
    static let sideChar = "|"
    static let maxSignWidth = 35
    
    static func build(with message: [String]) -> String{
        let message = auditMessage(message)
        return buildSign(with: message)
    }
    
    static func auditMessage(_ message: [String]) -> [String] {
        guard !message.isEmpty else {
            let returnMessage = "No Message Given".components(separatedBy: CharacterSet.newlines)
            return returnMessage
        }
        
        for word in message {
            if (word.count > (maxSignWidth - 3)) {
                let returnMessage =  "One of your words are too long".components(separatedBy: CharacterSet.newlines)
                return returnMessage
            }
        }
        
        return message
    }
    
    static func createLines(with message: [String]) -> [String] {
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
    
    static func buildSign(with lines: [String]) -> String {
        // Get Longest Length
        var longest = 9
        for line in lines {
            if line.count > longest {
                longest = line.count
            }
        }
        
        // Build
        let boundary = buildSignBoundary(length: longest + 2)
        var sign = boundary + "\n"
        for line in lines {
            let endBuffer = String(repeating: " ", count: longest - (line.count))
            let full = "\(sideChar) \(line.uppercased())\(endBuffer) \(sideChar)\n"
            sign.append(full)
        }
        sign.append(boundary)
        return sign
    }
    
    static func buildSignBoundary(length: Int) -> String {
        let dashes = String(repeating: topChar, count: length)
        return "\(sideChar)\(dashes)\(sideChar)"
    }
}
