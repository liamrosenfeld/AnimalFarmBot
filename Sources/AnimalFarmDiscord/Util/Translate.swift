//
//  Translate.swift
//  AnimalFarmDiscord
//
//  Created by Liam Rosenfeld on 4/19/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation
import AnimalFarm

class Translate {
    static func convert(_ animal: Animal, with message: [String]) -> MsgStructure {
        var structure = MsgStructure(animal: animal.art, style: animal.defaultBubble)
        var message = message

        // Get Bubble Style
        if let bubble = getBubble(from: &message) {
            // Bubble Style Then Message
            structure.style = bubble
            structure.content = Content.message(message)
        }

        // Get Content
        structure.content = getContent(from: &message)

        return structure
    }

    private static func getBubble(from message: inout [String]) -> Bubble? {
        // Verify It's a Command
        guard var command = message.first else {
            return nil
        }
        guard command.contains("--") else {
            return nil
        }
        message.removeFirst()

        // Get Bubble
        let index = String.Index(utf16Offset: 1, in: command)
        command.removeSubrange(...index)
        guard let bubble = bubbles[command] else {
            return nil
        }
        return bubble
    }

    private static func getContent(from message: inout [String]) -> Content {
        if let nextAnimal = animals[message.joined()] {
            // Animal Word with Nothing Else
            return Content.asciiArt(nextAnimal.art.components(separatedBy: .newlines))
        } else if let embed = animals[message.first ?? ""] {
            // Animal Word Followed By Something Else
            message.removeFirst()
            return Content.embed(convert(embed, with: message))
        } else {
            // Just Message
            return Content.message(message)
        }
    }
}
