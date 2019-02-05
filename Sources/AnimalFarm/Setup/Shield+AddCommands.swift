//
//  Shield+AddCommands.swift
//  AnimalFarm
//
//  Created by Liam on 2/1/19.
//

import Foundation
import Sword

extension Shield {
    func addUtilities() {
        self.register("ping") { msg, _ in
            let animalMaker = AnimalBuilder(animal: Animal.allCases.randomElement() ?? .bunny)
            let animal = animalMaker.build(with: ["Pong!"])
            msg.reply(with: animal)
        }

        self.register("info", message: """
                            <> with ❤ By Liam Rosenfeld.
                            Check Out The Source Code Here: https://github.com/liamrosenfeld/AnimalFarmBot
                            """)

        self.register("help", message: """
                            `!<animal> <message>` -> animal says the message
                            `!animal` -> Lists supported animals
                            `!ping` -> Ping the bot
                            `!help` -> Bring up this help menu
                            `!info` -> Show Credits and Link to Source Code
                            """)
    }

    func addAnimals() {
        var helpText = "Supported Animals:"

        Animal.allCases.forEach { animal in
            let name = String(describing: animal)
            self.register(name) { msg, args in
                let animalMaker = AnimalBuilder(animal: animal)
                let animal = animalMaker.build(with: args)
                msg.reply(with: animal)
            }
            helpText += "\n- `\(name)`"
        }

        self.register("random") { msg, args in
            let animalMaker = AnimalBuilder(animal: Animal.allCases.randomElement() ?? .bunny)
            let animal = animalMaker.build(with: args)
            msg.reply(with: animal)
            helpText += "\n- `random`"
        }

        self.register("animals", message: helpText)
    }

    func addPublicStats() {
        self.register("stats") { _, _ in
            print("\nServers:")
            for guild in self.guilds {
                print(" - \(guild.value.name)")
            }

            print("\n")

            print("Totals:")
            print("\(self.guilds.count) Servers")
            print("\(self.dms.count) DMs")
            print("\(self.groups.count) Groups")
        }
    }

    func addPrivateStats() {
        self.register("stats") { msg, _ in
            print("\nServers:")
            for guild in self.guilds {
                print(" - \(guild.value.name)")
            }

            var message = "I Am In:\n"
            message.append("\(self.guilds.count) Servers\n")
            message.append("\(self.dms.count) DMs\n")
            message.append("\(self.groups.count) Groups\n")
            msg.reply(with: message)
        }
    }
}

