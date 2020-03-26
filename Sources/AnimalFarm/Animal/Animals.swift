//
//  Animals.swift
//  AnimalFarm
//
//  Created by Liam Rosenfeld on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

public let animals = [
    "bunny": bunny,
    
    "cow": Animal(
        art: #"""
        ^__^
        (oo)\_______
        (__)\ o O o )\/\
            ||----w |
            ||     ||
        """#,
        recBubbleWidth: 15,
        defaultBubble: bubbles["say"]!
    ),

    "tux": Animal(
        art: #"""
            .--.
           |o_o |
           |:_/ |
          //   \ \
         (|     | )
        /'\_   _/`\
        \___):(___/
        """#,
        recBubbleWidth: 15,
        defaultBubble: bubbles["say"]!
    ),

    "cat": Animal(
        art: #"""
            /\_/\           ___
           : o_o :_______    \ \
              ^      __(  \.__) )
        (@)<_____>__(_____)____/
        """#,
        recBubbleWidth: 15,
        defaultBubble: bubbles["say"]!
    ),

    "dog": Animal(
        art: #"""
           __
        o-''|\_____/)
         \_/|_)     )
            \  __  /
            (_/ (_/
        """#,
        recBubbleWidth: 15,
        defaultBubble: bubbles["say"]!
    ),

    "pig": Animal(
        art: #"""
            _____
        ^..^     \9
        (oo)_____/
           WW  WW
        """#,
        recBubbleWidth: 15,
        defaultBubble: bubbles["say"]!
    ),

    "hedgehog": Animal(
        art: #"""
           ..::::::::.
          :::::::::::::
         /. `:::::::::::
        o__,_::::::::::'
        """#,
        recBubbleWidth: 15,
        defaultBubble: bubbles["say"]!
    ),

    "dino": Animal(
        art: #"""
         __
        (_ \
          \ \_.----._
           \         \
           |  ) |  )  \__
           |_|--|_|'-.__/
        """#,
        recBubbleWidth: 15,
        defaultBubble: bubbles["say"]!
    ),

    "frog": Animal(
        art: #"""
              _  _
             (.)(.)
         ,-.(.____.),-.
        ( \ \ '--' / / )
         \ \ / ,. \ / /
          ) '| || |' (
        """#,
        recBubbleWidth: 15,
        defaultBubble: bubbles["say"]!
    )
]

internal let bunny = Animal(
        art: #"""
        (\__/) ||
        (•ㅅ•) ||
        / 　 づ
        """#,
        recBubbleWidth: 15,
        defaultBubble: bubbles["sign"]!
)
