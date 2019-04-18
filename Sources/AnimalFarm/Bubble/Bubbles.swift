//
//  Bubbles.swift
//  AnimalFarm
//
//  Created by Liam on 4/15/19.
//

internal let bubbles = [
    "say": say,
    "think": Bubble(
            top: "~",
            btm: "~",
            left: "(",
            right: ")",
            line: "0"
    ),
]

internal let say = Bubble(
        top: "-",
        btm: "-",
        left: "|",
        right: "|",
        line: "\\"
)