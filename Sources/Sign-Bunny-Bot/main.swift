//
//  Main.swift
//  Sign Bunny Bot
//
//  Created by Liam Rosenfeld on 1/28/19.
//  Copyright © 2018 Liam Rosenfeld. All rights reserved.
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

bot.register("ping", message: BunnyBuilder.buildSignBunny(with: String("Pong!")))

bot.register("bunny") { msg, args in
    let content = args.joined(separator: " ")
    let bunny = BunnyBuilder.buildSignBunny(with: String(content))
    msg.reply(with: bunny)
}

bot.connect()
