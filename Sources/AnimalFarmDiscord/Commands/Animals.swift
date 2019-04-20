//
//  Animals.swift
//  AnimalFarmDiscord
//
//  Created by Liam Rosenfeld on 2/1/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation
import Sword
import AnimalFarm

extension Shield {
    func addAnimals() {
        // Add Individual Animals
        var animalList = "Supported Animals:"
        animals.forEach { name, animal in
            self.register(name) { msg, args in
                let structure = Translate.convert(animal, with: args)
                let message = AnimalFarm.build(structure)
                msg.reply(with: message)
            }
            animalList += "\n- `\(name)`"
        }

        // Add Random Animal
        self.register("random") { msg, args in
            let animal = AnimalFarm.buildRandom(with: args)
            msg.reply(with: animal)
            animalList += "\n- `random`"
        }

        // Add Animal Help
        self.register("animals", message: animalList)

        // Add Bubble Help
        var bubbleList = "Supported Bubbles:"
        bubbles.forEach { name, _ in
            bubbleList += "\n- `\(name)`"
        }
        self.register("bubbles", message: bubbleList)
    }
}
