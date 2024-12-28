//
//  RMCharactersResponse.swift
//  Recipe
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

// MARK: - Character
public struct RMCharacter: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: RMCharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String

    init(id: Int, 
         name: String,
         status: String,
         species: String,
         type: String,
         gender: String,
         origin: RMCharacterLocation,
         location: RMCharacterLocation,
         image: String,
         episode: [String],
         url: String,
         created: String) {
        
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

// MARK: - Location
public struct RMCharacterLocation: Codable {
    let name: String
    let url: String
}
