//
//  BunnyBuilder.swift
//  Sign-Bunny-Bot
//
//  Created by Liam on 1/28/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

struct BunnyBuilder {
    static let maxSignWidth = 13
    static let signBuilder = SignBuilder(topChar: "-", sideChar: "|", bottomChar: "-", maxSignWidth: 13)

    static let bunny = """
                    (\\__/) ||
                    (•ㅅ•) ||
                    / 　 づ
                    """

    static func build(with message: [String]) -> String {
        var message = message
        if message == ["bunny"] {
            message = ["(__/)", "(•ㅅ•)", "/ 　 づ"]
        }
        let signBunny = """
                    ```
                    \(signBuilder.build(with: message))
                    \(bunny)
                    ```
                    """
        return signBunny
    }

}
