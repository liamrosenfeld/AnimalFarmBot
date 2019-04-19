//
// Created by Liam on 2019-04-18.
//

import Foundation

public struct MsgStructure {
    var animal: String
    var style: Bubble
    var content: Content
}

extension MsgStructure {
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
    case animal(MsgStructure)
    case message([String])
}
