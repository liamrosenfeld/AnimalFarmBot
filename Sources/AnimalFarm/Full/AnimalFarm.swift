//
//  AnimalFarm.swift
//  AnimalFarm
//
//  Created by Liam Rosenfeld on 4/15/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

public class AnimalFarm {
    public static func build(_ structure: MsgStructure) -> String {
        return """
            ```
            \(buildMessage(with: structure))
            ```
            """
    }

    static func buildMessage(with structure: MsgStructure) -> String {
        let bubbleBuilder = BubbleBuilder(structure.style)
        var content = [String]()

        // Fill Content With Structure Content
        switch structure.content {
        case .embed(let next):
            content = buildMessage(with: next).components(separatedBy: .newlines)
        case .message(let message):
            content = bubbleBuilder.createLines(with: message)
        case .asciiArt(let art):
            content = art
        }

        // Final Sections
        var bubble = bubbleBuilder.build(with: content)
        var animal = structure.animal

        // If There is No Bubble
        if bubble != "" {
            bubble += "\n"
            animal = AnimalBuilder.addLine(of: structure.style.line, to: animal)
        }

        return bubble + animal
    }

    public static func buildRandom(with message: [String]) -> String {
        let animal = (animals.randomElement()?.value) ?? bunny
        let structure = MsgStructure(animal: animal.art, content: .message(message))
        return build(structure)
    }

    public static func buildRandom(with message: String) -> String {
        let split = message.components(separatedBy: .whitespaces)
        return buildRandom(with: split)
    }
}
