//
//  Animal.swift
//  Sign-Bunny-Bot
//
//  Created by Liam on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

enum Animal: String {
    case bunny = """
                (\\__/) ||
                (•ㅅ•) ||
                / 　 づ
                """
    
    case cow = """
                \\   ^__^
                 \\  (oo)\\_______
                    (__)\\       )\\/\\
                        ||----w |
                        ||     ||
            """
    
    case tux = """
                \\   .--.
                 \\ |o_o |
                   |:_/ |
                  //   \\ \\
                 (|     | )
                /'\\_   _/`\\
                \\___)=(___/
            """
    
    case cat = """
        \\   /\\_/\\           ___
         \\ = o_o =_______    \\ \\
            __^      __(  \\.__) )
        (@)<_____>__(_____)____/
    """
}

extension Animal: CaseIterable {}
