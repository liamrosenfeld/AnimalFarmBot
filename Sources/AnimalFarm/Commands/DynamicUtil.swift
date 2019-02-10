//
//  DynamicUtil.swift
//  AnimalFarm
//
//  Created by Liam on 2/9/19.
//

import Foundation
import Sword
import HeliumLogger
import LoggerAPI

extension Shield {
    func addDynamicUtil() {
        self.register("ping") { msg, _ in
            let animalMaker = AnimalBuilder(animal: Animal.allCases.randomElement() ?? .bunny)
            let animal = animalMaker.build(with: ["Pong!"])
            msg.reply(with: animal)
        }
        
        self.register("stats") { msg, _ in
            self.logStats()
            
            #if DEBUG
            self.sendStats(on: msg)
            #endif
        }
    }
    
    fileprivate func logStats() {
        var log = "\nServers:"
        for guild in self.guilds {
            log += "\n - \(guild.value.name)"
        }
        
        log += "\n\n"
        
        log += "Totals:\n"
        log += "\(self.guilds.count) Servers\n"
        log += "\(self.dms.count) DMs\n"
        log += "\(self.groups.count) Groups\n"
        
        Log.info(log)
    }
    
    fileprivate func sendStats(on msg: Message) {
        var message = "I Am In:\n"
        message.append("\(self.guilds.count) Servers\n")
        message.append("\(self.dms.count) DMs\n")
        message.append("\(self.groups.count) Groups")
        msg.reply(with: message)
    }
    
}
