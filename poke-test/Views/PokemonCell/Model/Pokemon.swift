//
//  Pokemon.swift
//  poke-test
//
//  Created by Samantha Cruz on 28/2/23.
//

import Foundation

struct Pokemon: Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable {
    let id = UUID()
    var name: String
    var url: String
}

struct PokemonSelected : Codable {
    var sprites: PokemonSprites
    var weight: Int
}

struct PokemonSprites : Codable {
    var front_default: String?
}









