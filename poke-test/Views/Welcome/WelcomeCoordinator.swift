//
//  WelcomeCoordinator.swift
//  poke-test
//
//  Created by Samantha Cruz on 3/3/23.
//

import UIKit
import SwiftUI

final class WelcomeCoordinator<R: AppRouter> {
    let router: R
    
    private lazy var primaryViewController: UIViewController = {
        let viewModel = WelcomeViewModel<R>()
        viewModel.router = router
        let viewController = UIHostingController(rootView: WelcomeView(viewModel: viewModel))
        return viewController
    }()
    
    init(router: R) {
        self.router = router
    }
}

extension WelcomeCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(primaryViewController, animated: true)
    }
}
