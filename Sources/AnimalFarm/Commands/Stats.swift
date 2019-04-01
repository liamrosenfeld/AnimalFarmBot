//
//  Hidden.swift
//  AnimalFarm
//
//  Created by Liam on 2/19/19.
//

import Foundation
import Sword
import Logging

extension Shield {
    func addHidden() {
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
            
            if args[1] == "here" {
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

