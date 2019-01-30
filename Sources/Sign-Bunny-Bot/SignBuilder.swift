//
//  SignBuilder.swift
//  Sign-Bunny-Bot
//
//  Created by Liam on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

struct SignBuilder {
    var topChar: Character
    var sideChar: Character
    var bottomChar: Character
    var maxSignWidth = 13
    
    func build(with message: [String]) -> String{
        let message = auditMessage(message)
        let sign = """
                \(buildSignBoundary())
                \(buildMiddle(with: message))
                \(buildSignBoundary())
                """
        return sign
    }
    
    func auditMessage(_ message: [String]) -> [String] {
        guard !message.isEmpty else {
            let returnMessage = "No Message Given".split(separator: " ").map { String($0) }
            return returnMessage
        }
        
        for word in message {
            if (word.count > (maxSignWidth - 3)) {
                let returnMessage =  "One of your words are too long".split(separator: " ").map { String($0) }
                return returnMessage
            }
        }
        
        return message
    }
    
    func buildMiddle(with message: [String]) -> String {
        var lines = [String]()
        
        for word in message {
            var line = ""
            
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
            
            if line != "" {
                lines.append(line)
            }
        }
        
        lines = lines.map(buildLine)
        let middle = lines.joined(separator: "\n")
        return middle
    }
    
    func buildLine(line: String) -> String {
        let endBuffer = String(repeating: " ", count: maxSignWidth - (line.count + 1))
        return "| \(line.uppercased())\(endBuffer)|"
    }
    
    func buildSignBoundary() -> String {
        let spaces = String(repeating: "-", count: maxSignWidth)
        return "|" + spaces + "|"
    }
}
