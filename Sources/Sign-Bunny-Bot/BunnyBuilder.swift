//
//  BunnyBuilder.swift
//  Sign-Bunny-Bot
//
//  Created by Liam on 1/28/19.
//

import Foundation

struct BunnyBuilder {
    static let maxSignWidth = 13

    static func buildBunny() -> String {
        return """
             (\\__/) ||
             (•ㅅ•) ||
             / 　 づ
            """
    }

    static func buildSignBoundary() -> String {
        let spaces = String(repeating: "-", count: maxSignWidth)
        return "|" + spaces + "|"
    }


    static func buildMiddleOfSign(message: String) -> String{
        var inputArr = message.split(separator: " ")
        
        if inputArr.isEmpty {
            inputArr = ["no", "message", "given"]
        }
        
        var lines = [String]()
        
        if message == "bunny" {
            lines = ["(__/)", "(•ㅅ•)", "/ 　 づ"]
            inputArr.removeAll()
        }
        
        for word in inputArr {
            var line = ""
            if (word.count > (maxSignWidth - 3)) {
                lines = ["One of your", "words are", "too long"]
                break
            }
        
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


    static func buildLine(line: String) -> String {
        let endBuffer = String(repeating: " ", count: maxSignWidth - (line.count + 1))
        return "| \(line.uppercased())\(endBuffer)|"
    }


    static func buildSignBunny(with message: String) -> String{
        let sign = """
                ```
                \(buildSignBoundary())
                \(buildMiddleOfSign(message: message))
                \(buildSignBoundary())
                \(buildBunny())
                ```
                """
        return sign
    }
}
