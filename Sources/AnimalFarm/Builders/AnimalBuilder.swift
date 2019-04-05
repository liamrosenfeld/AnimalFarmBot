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
    
    let animals = Animal.allCases.reduce(into: [String: String]()) {
        $0[String(describing:$1)] = $1.rawValue
    }
    
    func build(with message: [String]) -> String {
        var content = [String]()
        
        if let special = animals[message.joined()] {
            content = special.components(separatedBy: CharacterSet.newlines)
        } else {
            content = SignBuilder.createLines(with: message)
        }
        
        let animalArt = """
        ```
        \(SignBuilder.build(with: content))
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
