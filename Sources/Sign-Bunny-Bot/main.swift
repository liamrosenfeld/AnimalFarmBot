//
//  Main.swift
//  Sign Bunny Bot
//
//  Created by Liam Rosenfeld on 1/28/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation
import Sword

guard let token = ProcessInfo.processInfo.environment["DISCORD_BOT_SECRET"] else {
    fatalError("No Secret Key Provided")
}

let swordOptions = SwordOptions()

let shieldOptions = ShieldOptions(
    prefixes: ["!"],
    willIgnoreBots: true
)

let bot = Shield(token: token, swordOptions: swordOptions, shieldOptions: shieldOptions)

bot.editStatus(to: "online", playing: "Version 2 Test (So Be Nice) ;)")

bot.register("ping", message: BunnyBuilder.build(with: ["🏓 Pong!"]))

bot.register("info", message: """
                            <> with ❤ By Liam Rosenfeld.
                            Check Out The Source Code Here: https://github.com/liamrosenfeld/Sign-Bunny-Bot
                            """)

bot.register("help", message: """
                            `!<animal> <message>` -> animal says the message
                            `!animal` -> Lists supported animals
                            `!ping` -> Ping the bot
                            `!help` -> Bring up this help menu
                            `!info` -> Show Credits and Link to Source Code
                            """)

bot.register("!animals", message: """
                            - `bunny` (Sign Bunny)
                            - `cow`
                            - `tux` (Penguin)
                            """)

bot.register("bunny") { msg, args in
    let bunny = BunnyBuilder.build(with: args)
    msg.reply(with: bunny)
}

bot.register("cow") { msg, args in
    let animalMaker = AnimalBuilder(animal: .cow)
    let cow = animalMaker.build(with: args)
    msg.reply(with: cow)
}

bot.register("tux") { msg, args in
    let animalMaker = AnimalBuilder(animal: .tux)
    let tux = animalMaker.build(with: args)
    msg.reply(with: tux)
}

bot.connect()
