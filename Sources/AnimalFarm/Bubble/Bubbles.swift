//
//  Bubbles.swift
//  AnimalFarm
//
//  Created by Liam on 4/15/19.
//

public let bubbles = [
    "say": say,
    "think": Bubble(
            top: "~",
            btm: "~",
            left: "(",
            right: ")",
            line: "0",
            topSides: false
    ),
    "yell": Bubble(
            top: "∧",
            btm: "∨",
            left: "<",
            right: ">",
            line: "X",
            topSides: false
    ),
    "sign": Bubble(
            top: "-",
            btm: "-",
            left: "|",
            right: "|",
            line: "",
            topSides: true
    ),
]

public let say = Bubble(
        top: "-",
        btm: "-",
        left: "|",
        right: "|",
        line: "\\",
        topSides: true
)