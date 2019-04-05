//
//  AnimalBuilder.swift
//  AnimalFarm
//
//  Created by Liam on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

class AnimalBuilder {
    
    static let animals = Animal.allCases.reduce(into: [String: String]()) {
        $0[String(describing:$1)] = $1.rawValue
    }
    
    static func build(_ animal: Animal, with message: [String]) -> String {
        var content = [String]()
        
        if let special = animals[message.joined()] {
            content = special.components(separatedBy: .newlines)
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
    
    static func buildRandom(with message: [String]) -> String {
        let animal = Animal.allCases.randomElement() ?? .bunny
        return build(animal, with: message)
    }
    
    static func buildRandom(with message: String) -> String {
        let split = message.components(separatedBy: .newlines)
        return buildRandom(with: split)
    }
}
