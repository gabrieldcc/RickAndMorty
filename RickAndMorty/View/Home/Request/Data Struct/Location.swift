//
//  Location.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 21/12/22.
//

import Foundation

struct Location: Codable {
    let name: String
    let url: String
}


enum Species: String, Codable {
    init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            self = Species(rawValue: string) ?? .unknown
        }
    
    case alien = "Alien"
    case human = "Human"
    case humanoid = "Humanoid"
    case unknown = "unknown"
}

enum Status: String, Codable {
    init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            self = Status(rawValue: string) ?? .unknown
        }
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
