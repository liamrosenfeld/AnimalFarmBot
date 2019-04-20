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
            line: "0"
    ),
    "yell": Bubble(
            top: "∧",
            btm: "∨",
            left: "<",
            right: ">",
            line: "X"
    ),
    "sign": Bubble(
            top: "-",
            btm: "-",
            left: "|",
            right: "|",
            line: ""
    ),
]

public let say = Bubble(
        top: "-",
        btm: "-",
        left: "|",
        right: "|",
        line: "\\"
)