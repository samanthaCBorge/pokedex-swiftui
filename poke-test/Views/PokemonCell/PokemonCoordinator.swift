//
//  PokemonCoordinator.swift
//  poke-test
//
//  Created by Samantha Cruz on 28/2/23.
//

import UIKit
import SwiftUI

final class PokemonCoordinator<R: AppRouter> {
    let router: R
    
    private lazy var primaryViewController: UIViewController = {
        let viewModel = PokemonViewModel<R>()
        viewModel.router = router
        let viewController = UIHostingController(rootView: PokemonListView(viewModel: viewModel))
        return viewController
    }()
    
    init(router: R) {
        self.router = router
    }
}

extension PokemonCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}

