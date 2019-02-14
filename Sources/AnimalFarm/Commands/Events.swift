//
//  Events.swift
//  AnimalFarm
//
//  Created by Liam on 2/13/19.
//

import Foundation
import Sword

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
            
            var message = AnimalBuilder.randomBuilder.build(with: "Hello! I'm Animal Farm!")
            message += AnimalBuilder.randomBuilder.build(with: "Use Me By Typing !<animal> <message>")
            message += AnimalBuilder.randomBuilder.build(with: "Just Type !animals for a list of all available animals")
            message += AnimalBuilder.randomBuilder.build(with: "And !help for all command avaliable")
            channel.send(message)
        }
    }
}
