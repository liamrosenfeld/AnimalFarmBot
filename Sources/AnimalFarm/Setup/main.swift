//
//  Main.swift
//  AnimalFarm
//
//  Created by Liam Rosenfeld on 1/28/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation
import Sword
import Logging

do {
    let bot = try Bot()
    bot.start()
} catch {
    fatalError(error.localizedDescription)
}

extension Logger {
    static var log = Logger(label: "com.liamrosenfeld.AnimalFarm")
}
