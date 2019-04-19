//
//  AnimalFarm.swift
//  AnimalFarm
//
//  Created by Liam Rosenfeld on 4/15/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

public class AnimalFarm {
    public static func build(_ animal: String, with message: [String]) -> String {
        let structure = convert(animal, doing: bubbles["say", default: say], with: message)
        return """
            ```
            \(buildMessage(with: structure))
            ```
            """
    }

    // TODO: Move to AnimalFarmDiscord
    static func convert(_ animal: String, doing bubbleStyle: Bubble, with message: [String]) -> MsgStructure {
        var structure = MsgStructure(animal: animal)
        if let specialAnimal = animals[message.joined()] {
            // Animal Word with Nothing Else
            structure.content = Content.message(specialAnimal.components(separatedBy: .newlines))
        } else if let specialAnimal = animals[message.first ?? ""] {
            // Animal Word Followed By Something Else
            let specialAnimal = addLine(of: bubbleStyle.line, to: specialAnimal)
            var message = message
            message.removeFirst()
            structure.content = Content.animal(convert(specialAnimal, doing: bubbleStyle, with: message))
        } else {
            // Just Message
            structure.content = Content.message(BubbleBuilder.createLines(with: message))
        }

        return structure
    }

    static func buildMessage(with structure: MsgStructure) -> String {
        let bubbleBuilder = BubbleBuilder(structure.style)
        var content = [String]()

        switch structure.content {
        case .animal(let next):
            content = buildMessage(with: next).components(separatedBy: .newlines)
        case .message(let message):
            content = message
        }

        let bubble = bubbleBuilder.build(with: content)
        let animal = addLine(of: structure.style.line, to: structure.animal)

        let assembled = """
                    \(bubble)
                    \(animal))
                    """
        return assembled
    }

    static func addLine(of style: String, to animal: String) -> String {
        if animal != bunny {
            return AnimalBuilder.addLine(of: style, to: animal)
        }
        return animal
    }

    public static func buildRandom(with message: [String]) -> String {
        let animal = (animals.randomElement()?.value) ?? bunny
        return build(animal, with: message)
    }

    public static func buildRandom(with message: String) -> String {
        let split = message.components(separatedBy: .whitespaces)
        return buildRandom(with: split)
    }
}
