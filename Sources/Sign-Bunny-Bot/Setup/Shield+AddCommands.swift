//
//  Shield+AddCommands.swift
//  Sign-Bunny-Bot
//
//  Created by Liam on 2/1/19.
//

import Foundation
import Sword

extension Shield {
    func addUtilities() {
        self.register("ping", message: BunnyBuilder.build(with: ["🏓 Pong!"]))
        
        self.register("info", message: """
                            <> with ❤ By Liam Rosenfeld.
                            Check Out The Source Code Here: https://github.com/liamrosenfeld/Sign-Bunny-Bot
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
        self.register("bunny") { msg, args in
            let bunny = BunnyBuilder.build(with: args)
            msg.reply(with: bunny)
        }
        
        var helpText = "Supported Animals:\n- `bunny` (Sign Bunny)"
        
        Animal.allCases.forEach { animal in
            let name = String(describing: animal)
            self.register(name) { msg, args in
                let animalMaker = AnimalBuilder(animal: animal)
                let animal = animalMaker.build(with: args)
                msg.reply(with: animal)
            }
            helpText += "\n- `\(name)`"
        }
        
        self.register("animals", message: helpText)
    }
}

