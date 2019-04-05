//
//  Animals.swift
//  AnimalFarm
//
//  Created by Liam on 2/1/19.
//

import Foundation
import Sword

extension Shield {
    func addAnimals() {
        var helpText = "Supported Animals:"

        Animal.allCases.forEach { animal in
            let name = String(describing: animal)
            self.register(name) { msg, args in
                let animal = AnimalBuilder.build(animal, with: args)
                msg.reply(with: animal)
            }
            helpText += "\n- `\(name)`"
        }

        self.register("random") { msg, args in
            let animal = AnimalBuilder.buildRandom(with: args)
            msg.reply(with: animal)
            helpText += "\n- `random`"
        }

        self.register("animals", message: helpText)
    }
}

