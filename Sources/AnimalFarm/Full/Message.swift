//
//  Message.swift
//  AnimalFarm
//
//  Created by Liam Rosenfeld on 4/18/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//


import Foundation

public struct MsgStructure {
    public var animal: String
    public var style: Bubble
    public var content: Content
}

public extension MsgStructure {
    init(animal: String, content: Content) {
        self.animal = animal
        self.style = say
        self.content = content
    }

    init(animal: String, style: Bubble) {
        self.animal = animal
        self.style = style
        self.content = Content.message([])
    }

    init(animal: String) {
        self.animal = animal
        self.style = say
        self.content = Content.message([])
    }
}

public indirect enum Content {
    case embed(MsgStructure)
    case message([String])
    case asciiArt([String])
}
