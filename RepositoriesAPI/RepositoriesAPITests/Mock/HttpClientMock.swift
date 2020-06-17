//
//  HttpClientMock.swift
//  RepositoriesAPITests
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import XCTest
@testable import RepositoriesAPI

class ClientMock: ClientProtocol {
    var isFailure = false
    
    func requestData<T : Decodable>(with setup: ClientSetup, completion: @escaping (Result<T>) -> Void) {
        if isFailure {
            completion(.failure(ClientError.invalidHttpResponse))
            return
        } else {
            completion(generateData())
        }
    }
    
    private func generateData<T: Decodable>() -> Result<T> {
        guard
            
            let filePath = Bundle.main.path(forResource: "repositories", ofType: "json")
            else {
                XCTFail("Could not mock data!")
                return .failure(ClientError.brokenData)
        }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath),
                                    options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let responseModel = try decoder.decode(T.self, from: jsonData)
            return .success(responseModel)
        } catch { }
        return .failure(ClientError.brokenData)
    }
}
