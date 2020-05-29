//
//  Coordinator.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import UIKit

protocol UpcomingCoordinatorProtocol {
    func start()
    var navigationController: UINavigationController { get }
}

class Coordinator: UpcomingCoordinatorProtocol {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.barStyle = UIBarStyle.black
        navigationController.navigationBar.tintColor = .blue
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func start() {
        
    }
}
