//
//  Bot.swift
//  AnimalFarmDiscord
//
//  Created by Liam Rosenfeld on 2/9/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation
import Sword

class Bot: Shield {
    init() throws {
        guard let token = ProcessInfo.processInfo.environment[SecretNames.bot.rawValue] else {
            throw BotError.noKey
        }
        
        let swordOptions = SwordOptions()
        let shieldOptions = ShieldOptions(
            prefixes: ["!"],
            willIgnoreBots: true
        )
        
        super.init(token: token, swordOptions: swordOptions, shieldOptions: shieldOptions)
    
        self.addUtil()
        self.addEvents()
        self.addAnimals()
        self.addStats()
    }
    
    func start() {
        #if DEBUG
        self.editStatus(to: "online", playing: "Testing (So Be Nice) :)")
        #endif
        self.connect()
    }
    
    enum BotError: Error {
        case noKey
    }
}
