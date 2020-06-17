//
//  GatewaySetupTests.swift
//  RepositoriesAPITests
//
//  Created by Lorrayne Paraiso on 30/05/20.
//

import XCTest
@testable import RepositoriesAPI

class GatewaySetupTests: XCTestCase {
    var sut: GatewaySetup!
    
    override func setUp() { }
    
    func testGetSwiftRepositoriesEndpoint() {
        let expectedEndpoint = "https://api.github.com/search/repositories?q=language:swift&sort=stars&page=1"
        
        sut = .search(page: 1, language: "swift")
        
        XCTAssertEqual(sut.endpoint, expectedEndpoint)
    }
}
