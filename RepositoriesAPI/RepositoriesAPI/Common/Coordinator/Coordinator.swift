//
//  Coordinator.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import UIKit

protocol CoordinatorProtocol {
    func start()
    func navigateToRepositoriesDetail(fullName: String, repoName: String)
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

    func navigateToRepositoriesDetail(fullName: String, repoName: String) {
        if let viewController = DetailView(fullName: fullName, repoName: repoName) {
            navigationController.pushViewController(viewController, animated: false)
        }
    }
}
