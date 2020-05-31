//
//  HomeServiceTests.swift
//  RepositoriesAPITests
//
//  Created by Lorrayne Paraiso on 30/05/20.
//

import XCTest
@testable import RepositoriesAPI

class HomeServiceTests: XCTestCase {
    var sut: HomeService!
    var clientMock: ClientMock!
    
    override func setUp() {
        self.clientMock = ClientMock()
        self.sut = HomeService(client: clientMock)
    }
    
    func test_getSwiftRepositories_whenClientReturnsSucess() {
        let gatewayExpectation = expectation(description: #function)
        let expectedRepositoryName = "awesome-ios"
        var serviceResult: Repositories?

        sut.getSwiftRepositories(page: 1, language: "swift") { (result) in
            switch result {
                case let .success(repositoryResponse):
                    serviceResult = repositoryResponse
                case .failure(_):
                    XCTFail("Result is different of \(Repositories.self).")
            }
            gatewayExpectation.fulfill()
        }

        waitForExpectations(timeout: 0.3) { (_) in
            XCTAssertEqual(serviceResult?.items.first?.name, expectedRepositoryName)
        }
    }
    
    func test_getSwiftRepositories_whenClientReturnsFailure() {
        let gatewayExpectation = expectation(description: #function)
        clientMock.isFailure = true
        let expectedError = ClientError.invalidHttpResponse
        var gatewayResult: ClientError?

        sut.getSwiftRepositories(page: 1, language: "swift") { (result) in
            if case let .failure(error) = result {
                gatewayResult = error
            } else {
                XCTFail("Result is different of \(ClientError.self).")
            }
            gatewayExpectation.fulfill()
        }

        waitForExpectations(timeout: 0.3) { (_) in
            XCTAssertEqual(gatewayResult?.localizedDescription, expectedError.localizedDescription)
        }
    }
    
}
