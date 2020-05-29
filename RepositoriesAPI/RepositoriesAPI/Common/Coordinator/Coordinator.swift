//
//  Coordinator.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import UIKit

protocol CoordinatorProtocol {
    func start()
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
}
