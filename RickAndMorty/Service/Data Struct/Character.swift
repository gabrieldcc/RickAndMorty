//
//  Character.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 04/11/22.
//

import Foundation

// MARK: - Result
struct Character: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}



