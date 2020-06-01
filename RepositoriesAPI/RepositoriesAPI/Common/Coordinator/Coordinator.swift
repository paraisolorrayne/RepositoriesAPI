//
//  Coordinator.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import UIKit

protocol CoordinatorProtocol {
    func start()
    func navigateToRepositoriesDetail()
    var navigationController: UINavigationController { get }
}

class Coordinator: CoordinatorProtocol {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.barStyle = UIBarStyle.black
        navigationController.navigationBar.tintColor = .blue
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func start() {
        let viewController = HomeView(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }

//    func repositorieDetails(viewModel: MovieViewModel) {
//        let viewController = MovieViewController(viewModel: viewModel)
//        navigationController.pushViewController(viewController, animated: true)
//    }
    func navigateToRepositoriesDetail() {
        
    }
}
