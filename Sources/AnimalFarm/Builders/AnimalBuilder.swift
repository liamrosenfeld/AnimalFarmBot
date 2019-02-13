//
//  AnimalBuilder.swift
//  AnimalFarm
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
    
    func build(with message: String) -> String {
        let split = message.split(separator: " ").map{ String($0) }
        return build(with: split)
    }
    
    init(animal: Animal) {
        self.animal = animal
    }
    
    static var randomBuilder: AnimalBuilder {
        let animal = Animal.allCases.randomElement() ?? .bunny
        return AnimalBuilder(animal: animal)
    }
}
