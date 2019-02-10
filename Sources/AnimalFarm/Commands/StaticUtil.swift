//
//  StaticUtil.swift
//  AnimalFarm
//
//  Created by Liam on 2/9/19.
//

import Foundation
import Sword

extension Shield {
    func addStaticUtil() {
        self.register("info", message: """
                            <> with ❤ By Liam Rosenfeld. https://www.liamrosenfeld.com
                            Vote For The Bot (So More People can Find It) Here: https://discordbots.org/bot/511688790994059267
                            And Check Out The Source Code Here: https://github.com/liamrosenfeld/AnimalFarmBot
                            """)
        
        self.register("help", message: """
                            `!<animal> <message>` -> animal says the message
                            `!animals` -> Lists supported animals
                            `!ping` -> Ping the bot
                            `!help` -> Bring up this help menu
                            `!info` -> Information about the bot (Credits, Voting, Source Code)
                            """)
    }
}
