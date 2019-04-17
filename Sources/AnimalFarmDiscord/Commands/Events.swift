//
//  Events.swift
//  AnimalFarmDiscord
//
//  Created by Liam Rosenfeld on 2/13/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation
import Sword
import AnimalFarm

extension Shield {
    func addEvents() {
        self.on(.guildCreate) { data in
            let guild = data as! Guild
            var textChannel: TextChannel?
            for channel in guild.channels.reversed() {
                if channel.value is TextChannel {
                    textChannel = channel.value as? TextChannel
                }
            }
            guard let channel = textChannel else {
                return
            }
            
            var message = AnimalFarm.buildRandom(with: "Hello! I'm Animal Farm!")
            message += AnimalFarm.buildRandom(with: "Use Me By Typing !<animal> <message>")
            message += AnimalFarm.buildRandom(with: "Just Type !animals for a list of all available animals")
            message += AnimalFarm.buildRandom(with: "And !help for all command avaliable")
            channel.send(message)
        }
    }
}
