//
//  CoordinatorTests.swift
//  RepositoriesAPITests
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import XCTest
@testable import RepositoriesAPI


class CoordinatorTests: XCTestCase {
    var sut: Coordinator!
    var navigationController: UINavigationController!
    
    override func setUp() {
        self.navigationController = UINavigationController()
        self.sut = Coordinator(navigationController: navigationController)
    }
    
    func test_start_thenNavigationPushUpcomingMoviesViewController() {
        sut.start()
        
        XCTAssertEqual(sut.navigationController, navigationController)
        XCTAssertTrue(sut.navigationController.viewControllers.first is HomeView)
    }
    
    
}
