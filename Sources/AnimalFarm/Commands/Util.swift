//
//  Util.swift
//  AnimalFarm
//
//  Created by Liam on 2/9/19.
//

import Foundation
import Sword
import HeliumLogger
import LoggerAPI

extension Shield {
    func addUtil() {
        self.register("help", message: """
                            `!<animal> <message>` -> animal says the message
                            `!animals` -> Lists supported animals
                            `!vote` -> Link to Upvote The Bot So More People Can Discover it
                            `!add` -> Link to Add This Bot to Your Own Server
                            `!feedback` -> Link to Report Bugs Or Give Sugessions
                            `!ping` -> Ping the bot
                            `!help` -> Bring up this help menu
                            `!info` -> Credits and Link To Source Code
                            """)
        
        self.register("ping") { msg, _ in
            let animal = AnimalBuilder.randomBuilder.build(with: ["Pong!"])
            msg.reply(with: animal)
        }
        
        self.register("vote") { msg, _ in
            let message = """
                        \(AnimalBuilder.randomBuilder.build(with: "If You're Enjoying Me, Please Upvote Here:"))
                        <https://discordbots.org/bot/511688790994059267/vote>
                        """
            msg.reply(with: message)
        }

        self.register("add") { msg, _ in
            let message = """
                        \(AnimalBuilder.randomBuilder.build(with: "Add Me To Your Own Server Here:"))
                        <https://discordapp.com/api/oauth2/authorize?scope=bot&client_id=511688790994059267>
                        """
            msg.reply(with: message)
        }
        
        self.register("feedback") { msg, _ in
            let message = """
            \(AnimalBuilder.randomBuilder.build(with: "Please Report Bugs or Give Sugessions Here:"))
            <https://github.com/liamrosenfeld/AnimalFarmBot/issues/new>
            """
            msg.reply(with: message)
        }
        
        self.register("info") { msg, _ in
            let message = """
            \(AnimalBuilder.randomBuilder.build(with: "<> with ❤ By Liam Rosenfeld"))
            Here's my Website: <https://www.liamrosenfeld.com>
            And Check Out The Source Code Here: <https://github.com/liamrosenfeld/AnimalFarmBot>
            """
            msg.reply(with: message)
        }
    }
}
