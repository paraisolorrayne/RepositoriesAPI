//
//  HomeViewModelTests.swift
//  RepositoriesAPITests
//
//  Created by Lorrayne Paraiso on 31/05/20.
//

import XCTest
@testable import RepositoriesAPI


class HomeViewModelTests: XCTestCase {
    var sut: HomeViewModel!
    var service: HomeServiceProtocol!
    var clientMock: ClientMock!

    override func setUp() {
        self.clientMock = ClientMock()
        self.service = HomeService(client: clientMock)
        self.sut = HomeViewModel()
    }

    func test_numberResults_whenClientReturnsSucess() {
        let gatewayExpectation = expectation(description: #function)
        let expectedCountModel = 30
        var serviceResult: [Repositories]?
        service.getSwiftRepositories(page: 1, language: "swift") { (result) in
            switch result {
                case let .success(repositories):
                    serviceResult = [repositories]
                case let .failure(error):
                    XCTFail("Failure of \(error.localizedDescription).")
            }
            gatewayExpectation.fulfill()
        }
        waitForExpectations(timeout: 1.0) { (_) in
            XCTAssertEqual(serviceResult?.first?.items.count, expectedCountModel)
        }
    }

    func test_load_whenClientReturnsFailure() {
        let gatewayExpectation = expectation(description: #function)
        self.service = HomeService(client: clientMock)
        clientMock.isFailure = true
        let expectedError = ClientError.invalidHttpResponse
        var gatewayResult: ClientError?
        
        service.getSwiftRepositories(page: 1, language: "swift") { (result) in
            if case let .failure(error) = result {
                gatewayResult = error
            } else {
                XCTFail("Result is different of \(ClientError.self).")
            }
            gatewayExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10.0) { (_) in
            XCTAssertEqual(gatewayResult?.localizedDescription, expectedError.localizedDescription)
        }
    }
}
