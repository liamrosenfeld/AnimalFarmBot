//
//  AnimalBuilder.swift
//  AnimalFarm
//
//  Created by Liam Rosenfeld on 1/30/19.
//  Copyright © 2019 Liam Rosenfeld. All rights reserved.
//

import Foundation

public class AnimalBuilder {
    static let animals = Animal.allCases.reduce(into: [String: Animal]()) {
        $0[String(describing:$1)] = $1
    }
    
    public static func build(_ animal: Animal, with message: [String]) -> String {
        return """
        ```
        \(buildAnimal(animal, with: message))
        ```
        """
    }
    
    static func buildAnimal(_ animal: Animal, with message: [String]) -> String {
        var content = [String]()
        
        if let specialAnimal = animals[message.joined()] {
            content = specialAnimal.rawValue.components(separatedBy: .newlines)
        } else if let specialAnimal = animals[message[0]] {
            var message = message
            message.removeFirst()
            content = buildAnimal(specialAnimal, with: message).components(separatedBy: .newlines)
        } else {
            content = SignBuilder.createLines(with: message)
        }
        
        let animalArt = """
        \(SignBuilder.build(with: content))
        \(animal.rawValue)
        """
        return animalArt
    }
    
    public static func buildRandom(with message: [String]) -> String {
        let animal = Animal.allCases.randomElement() ?? .bunny
        return build(animal, with: message)
    }
    
    public static func buildRandom(with message: String) -> String {
        let split = message.components(separatedBy: .whitespaces)
        return buildRandom(with: split)
    }
}
