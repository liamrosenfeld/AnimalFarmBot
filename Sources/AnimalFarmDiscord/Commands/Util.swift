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
                            `!<animal> <message>` -> animal says the message
                            `!<animal> <animal>... <message>` -> an animal inside an animal... animal-ception!
                            `!animals` -> Lists supported animals
                            `!vote` -> Link to Upvote The Bot So More People Can Discover it
                            `!add` -> Link to Add This Bot to Your Own Server
                            `!feedback` -> Link to Report Bugs Or Give Sugessions
                            `!ping` -> Ping the bot
                            `!help` -> Bring up this help menu
                            `!info` -> Credits and Link To Source Code
                            """)
        
        self.register("ping") { msg, _ in
            let animal = AnimalBuilder.buildRandom(with: ["Pong!"])
            msg.reply(with: animal)
        }
        
        self.register("vote") { msg, _ in
            let message = """
                        \(AnimalBuilder.buildRandom(with: "If You're Enjoying Me, Please Upvote Here:"))
                        <https://discordbots.org/bot/511688790994059267/vote>
                        """
            msg.reply(with: message)
        }

        self.register("add") { msg, _ in
            let message = """
                        \(AnimalBuilder.buildRandom(with: "Add Me To Your Own Server Here:"))
                        <https://discordapp.com/api/oauth2/authorize?scope=bot&client_id=511688790994059267>
                        """
            msg.reply(with: message)
        }
        
        self.register("feedback") { msg, _ in
            let message = """
            \(AnimalBuilder.buildRandom(with: "Please Report Bugs or Give Sugessions Here:"))
            <https://github.com/liamrosenfeld/AnimalFarmBot/issues/new>
            """
            msg.reply(with: message)
        }
        
        self.register("info") { msg, _ in
            let message = """
            \(AnimalBuilder.buildRandom(with: "<> with ❤ By Liam Rosenfeld"))
            Here's my Website: <https://www.liamrosenfeld.com>
            And Check Out The Source Code Here: <https://github.com/liamrosenfeld/AnimalFarmBot>
            """
            msg.reply(with: message)
        }
    }
}
