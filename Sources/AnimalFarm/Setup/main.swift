//
//  Main.swift
//  AnimalFarm
//
//  Created by Liam Rosenfeld on 1/28/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation
import Sword
import HeliumLogger
import LoggerAPI

#if DEBUG
    HeliumLogger.use(LoggerMessageType.debug)
#else
    HeliumLogger.use(LoggerMessageType.info)
#endif

do {
    let bot = try Bot()
    bot.start()
} catch {
    Log.error(error.localizedDescription)
    fatalError(error.localizedDescription)
}


