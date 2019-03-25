//
//  Animal.swift
//  AnimalFarm
//
//  Created by Liam on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

enum Animal: String {
    case bunny = #"""
                 (\__/) ||
                 (•ㅅ•) ||
                 / 　 づ
                 """#
    
    case cow = #"""
                \   ^__^
                 \  (oo)\_______
                    (__)\       )\/\
                        ||----w |
                        ||     ||
               """#
    
    case tux = #"""
                \   .--.
                 \ |o_o |
                   |:_/ |
                  //   \ \
                 (|     | )
                /'\_   _/`\
                \___)=(___/
               """#
    
    case cat = #"""
                \   /\_/\           ___
                 \ = o_o =_______    \ \
                    __^      __(  \.__) )
                (@)<_____>__(_____)____/
               """#
    
    case dog = #"""
                \     __
                 \ o-''|\_____/)
                    \_/|_)     )
                       \  __  /
                       (_/ (_/
               """#
    
    case pig = #"""
                  \      _____
                   \ ^..^     \9
                     (oo)_____/
                        WW  WW
               """#
    
    case hedgehog = #"""
                      \     ..::::::::.
                       \   :::::::::::::
                        \ /. `:::::::::::
                         o__,_::::::::::'
                    """#
    
    case dino = #"""
                 \   __
                  \ (_ \
                      \ \_.----._
                       \         \
                        |  ) |  )  \__
                        |_|--|_|'-.__/
                """#
}

extension Animal: CaseIterable {}
