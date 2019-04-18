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
        return """
        ```
        \(buildAnimal(animal, doing: bubbles["say", default: say], with: message))
        ```
        """
    }

    static func buildAnimal(_ animal: String, doing bubbleStyle: Bubble, with message: [String]) -> String {
        var content = [String]()
        var animalArt = animal
        
        let bubbleBuilder = BubbleBuilder(bubbleStyle)
        if let specialAnimal = animals[message.joined()] {
            content = specialAnimal.components(separatedBy: .newlines)
        } else if let specialAnimal = animals[message.first ?? ""] {
            let specialAnimal = addLine(of: bubbleStyle.line, to: specialAnimal)
            var message = message
            message.removeFirst()
            content = buildAnimal(specialAnimal, doing: bubbleStyle, with: message).components(separatedBy: .newlines)
        } else {
            content = bubbleBuilder.createLines(with: message)
            if !message.isEmpty {
                animalArt = addLine(of: bubbleStyle.line, to: animal)
            }
        }

        let final = """
            \(bubbleBuilder.build(with: content))
            \(animalArt))
            """
        return final
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
