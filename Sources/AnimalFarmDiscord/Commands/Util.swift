//
//  Util.swift
//  AnimalFarmDiscord
//
//  Created by Liam Rosenfeld on 2/9/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation
import Sword
import AnimalFarm

extension Shield {
    func addUtil() {
        self.register("help", message: """
        **Normal Animals**
        !<animal> [--style] <message>  
            animal says the message
            * animal: animal to say it
            * --style (optional): style of the bubble
            * message: message to say

        !<animal>
            just send an animal
            * animal: animal to send

        **Animal-Ception**
        !<animal> [--style] <animal> [--style]... <message>
            an animal inside an animal... saying a message!
            * animal --style (repeating):  the animal and bubble style of each layer
            * message: message to say

        !<animal> [--style] <animal> [--style]... <animal>
            an animal inside an animal inside an animal...
            * animal --style (repeating): the animal and bubble style of each layer
            * animal: the final animal

        **Lists**
        !animals  
            Lists supported animals

        !bubbles  
            Lists supported bubbles

        **Utilities**
        !help  
            bring up this help menu

        !info
            show credits and link to source code

        !vote
            shows how to vote for this bot

        !feedback
            link for bug report or suggestions

        !add
            link to add to your own server

        !ping  
            ping the bot

        !stats
            shows stats for bot
        """)
        
        self.register("ping") { msg, _ in
            let animal = AnimalFarm.buildRandom(with: ["Pong!"])
            msg.reply(with: animal)
        }
        
        self.register("vote") { msg, _ in
            let message = """
                        \(AnimalFarm.buildRandom(with: "If You're Enjoying Me, Please Upvote Here:"))
                        <https://top.gg/bot/511688790994059267/vote>
                        """
            msg.reply(with: message)
        }

        self.register("add") { msg, _ in
            let message = """
                        \(AnimalFarm.buildRandom(with: "Add Me To Your Own Server Here:"))
                        <https://discordapp.com/api/oauth2/authorize?scope=bot&client_id=511688790994059267>
                        """
            msg.reply(with: message)
        }
        
        self.register("feedback") { msg, _ in
            let message = """
            \(AnimalFarm.buildRandom(with: "Please Report Bugs or Give Suggestions Here:"))
            <https://github.com/liamrosenfeld/AnimalFarmBot/issues/new>
            """
            msg.reply(with: message)
        }
        
        self.register("info") { msg, _ in
            let message = """
            \(AnimalFarm.buildRandom(with: "<> with ❤ By Liam Rosenfeld"))
            Here's my Website: <https://www.liamrosenfeld.com>
            And Check Out The Source Code Here: <https://github.com/liamrosenfeld/AnimalFarmBot>
            """
            msg.reply(with: message)
        }
    }
}
