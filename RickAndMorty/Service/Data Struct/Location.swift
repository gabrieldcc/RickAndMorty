//
//  Location.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 04/11/22.
//

import Foundation

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
