//
//  WelcomeViewModel.swift
//  poke-test
//
//  Created by Samantha Cruz on 3/3/23.
//

import Foundation

protocol WelcomeViewModelRepresentable {
      func goToPokemon()
}

final class WelcomeViewModel<R: AppRouter> {
    var router: R?
}

extension WelcomeViewModel: WelcomeViewModelRepresentable {
    func goToPokemon() {
        router?.process(route: .showPokemonList)
    }
}

