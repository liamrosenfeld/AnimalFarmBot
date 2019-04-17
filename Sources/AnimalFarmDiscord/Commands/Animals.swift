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
        var helpText = "Supported Animals:"

        Animal.allCases.forEach { animal in
            let name = String(describing: animal)
            self.register(name) { msg, args in
                let animal = AnimalFarm.build(animal, with: args)
                msg.reply(with: animal)
            }
            helpText += "\n- `\(name)`"
        }

        self.register("random") { msg, args in
            let animal = AnimalFarm.buildRandom(with: args)
            msg.reply(with: animal)
            helpText += "\n- `random`"
        }

        self.register("animals", message: helpText)
    }
}

