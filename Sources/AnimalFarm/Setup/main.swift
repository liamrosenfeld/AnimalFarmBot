//
//  Main.swift
//  AnimalFarm
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

#if DEBUG
    bot.editStatus(to: "online", playing: "Testing (So Be Nice) :)")

    bot.register("stats") { msg, _ in
        print("Servers:")
        for guild in bot.guilds {
            print(guild.value.name)
        }
        
        var message = "I Am In...\n"
        message.append("\(bot.guilds.count) Servers\n")
        message.append("\(bot.dms.count) DMs\n")
        message.append("\(bot.groups.count) Groups\n")
        msg.reply(with: message)
    }
#endif

bot.addUtilities()

bot.addAnimals()

bot.connect()
