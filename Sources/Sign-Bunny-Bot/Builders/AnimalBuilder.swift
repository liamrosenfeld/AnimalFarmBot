//
//  AnimalBuilder.swift
//  Sign-Bunny-Bot
//
//  Created by Liam on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

class AnimalBuilder {
    var animal: Animal
    
    let signBuilder = SignBuilder()
    
    func build(with message: [String]) -> String {
        var message = message
        if message == ["bunny"] {
            message = ["(__/)    ", "(•ㅅ•)    ", "/ 　 づ"]
        }
        
        let animalArt = """
        ```
        \(signBuilder.build(with: message))
        \(animal.rawValue)
        ```
        """
        return animalArt
    }
    
    init(animal: Animal) {
        self.animal = animal
    }
}
