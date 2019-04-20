//
//  Hidden.swift
//  AnimalFarmDiscord
//
//  Created by Liam Rosenfeld on 2/19/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation
import Sword
import Logging

extension Shield {
    func addStats() {
        self.register("stats") { msg, args in
            let message = """
                        I Am In:
                        \(self.guilds.count) Servers
                        \(self.dms.count) DMs
                        \(self.groups.count) Groups
                        """
            msg.reply(with: message)
        }
        
        self.register("servers") { msg, args in
            if !self.auth(args.first ?? "") {
                return
            }
            
            var message = "\nServers:"
            for guild in self.guilds {
                message += "\n - \(guild.value.name)"
            }
            message += "\nTotal: \(self.guilds.count)"
            
            if args.last ?? "" == "here" {
                msg.reply(with: message)
            } else {
                Logger.log.info("\(message)")
            }
        }
    }
    
    fileprivate func auth(_ pass: String) -> Bool {
        guard let password = ProcessInfo.processInfo.environment[SecretNames.stats.rawValue] else {
            Logger.log.warning("No Stat Password Provided")
            return false
        }
        
        return pass == password
    }
}
