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
            top: "M",
            btm: "W",
            left: "<",
            right: ">",
            line: "X"
    ),
    "title": Bubble(
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