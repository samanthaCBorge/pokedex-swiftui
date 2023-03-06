//
//  PokemonViewModel.swift
//  poke-test
//
//  Created by Samantha Cruz on 28/2/23.
//

import Foundation

protocol PokemonViewModelRepresentable {
    var pokemon: [Pokemon] {get set }
}

final class PokemonViewModel<R: AppRouter> {
    var router: R?
    var pokemon = [Pokemon]()


}

extension PokemonViewModel: PokemonViewModelRepresentable {

}





