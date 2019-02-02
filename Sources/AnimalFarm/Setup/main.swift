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

bot.editStatus(to: "online", playing: "Version 2 Test (So Be Nice) ;)")

bot.addUtilities()

bot.addAnimals()

bot.connect()
