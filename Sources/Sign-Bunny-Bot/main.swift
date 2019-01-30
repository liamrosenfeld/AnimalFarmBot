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

bot.editStatus(to: "online", playing: "Being Upgraded to V2!")

bot.register("ping", message: BunnyBuilder.build(with: ["🏓 Pong!"]))

bot.register("info", message: """
                            <> with ❤ By Liam Rosenfeld.
                            Check Out The Source Code Here: https://github.com/liamrosenfeld/Sign-Bunny-Bot
                            """)

bot.register("help", message: """
                            `!bunny <message>` -> Put that message in a sign
                            `!ping` -> Ping the bot
                            `!help` -> Bring up this help menu
                            `!info` -> Show Credits and Link to Source Code
                            """)

bot.register("bunny") { msg, args in
    let bunny = BunnyBuilder.build(with: args)
    msg.reply(with: bunny)
}

bot.connect()
