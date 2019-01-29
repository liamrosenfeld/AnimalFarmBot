//
//  Main.swift
//  Sign Bunny Bot
//
//  Created by Liam Rosenfeld on 1/28/19.
//  Copyright © 2018 Liam Rosenfeld. All rights reserved.
//

import Foundation
import Sword

guard let botKey = ProcessInfo.processInfo.environment["DISCORD_BOT_SECRET"] else {
    fatalError("No Secret Key Provided")
}

let bot = Sword(token: botKey)

bot.editStatus(to: "online", playing: "Being Upgraded to V2!")

bot.on(.messageCreate) { data in
    let msg = data as! Message
    
    if !msg.content.hasPrefix("!") {
        return
    }
    
    if msg.content.starts(with: "!ping")  {
        msg.reply(with: "Pong!")
    } else if msg.content.starts(with: "!bunny") {
        let messageStart = msg.content.index(msg.content.startIndex, offsetBy: 6)
        let message = msg.content[messageStart...]
        msg.reply(with: BunnyBuilder.buildSignBunny(with: String(message)))
    }
}

bot.connect()
