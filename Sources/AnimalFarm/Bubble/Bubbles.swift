//
//  Bubbles.swift
//  AnimalFarm
//
//  Created by Liam on 4/15/19.
//

internal let bubbles = [
    "say": say,
    "think": SpeechBubble(
            top: "~",
            btm: "~",
            left: "(",
            right: ")",
            line: "0"
    ),
]

let say = SpeechBubble(
        top: "-",
        btm: "-",
        left: "|",
        right: "|",
        line: "\\"
)