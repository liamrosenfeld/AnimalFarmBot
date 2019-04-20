//
//  Structure.swift
//  AnimalFarmDiscord
//
//  Created by Liam Rosenfeld on 4/19/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation
import AnimalFarm

class Structure {
    static func convert(_ animal: Animal, with message: [String]) -> MsgStructure {
        var structure = MsgStructure(animal: animal.art, style: animal.defaultBubble)
        if let nextAnimal = animals[message.joined()] {
            // Animal Word with Nothing Else
            structure.content = Content.asciiArt(nextAnimal.art.components(separatedBy: .newlines))
        } else if let embed = animals[message.first ?? ""] {
            // Animal Word Followed By Something Else
            var message = message
            message.removeFirst()
            structure.content = Content.embed(convert(embed, with: message))
        } else {
            // Just Message
            structure.content = Content.message(message)
        }

        return structure
    }
}
