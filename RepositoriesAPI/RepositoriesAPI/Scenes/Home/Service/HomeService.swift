//  
//  HomeService.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import Foundation

class HomeService: HomeServiceProtocol {
    private let client: ClientProtocol
    private lazy var queue: OperationQueue = {
        let operation = OperationQueue()
        operation.maxConcurrentOperationCount = 1
        operation.qualityOfService = .userInteractive
        return operation
    }()
    
    init(client: ClientProtocol) {
        self.client = client
    }
    
    func getSwiftRepositories(page: Int, language: String, completion: @escaping (Result<Repositories>) -> Void) {
        queue.addOperation { [weak self] in
            guard let gateway = self else { return }
            gateway.client.requestData(with: GatewaySetup.search(page: page, language: language)) { (result: Result<Repositories>) in
                switch result {
                    case let .success(upcomingResponse):
                        completion(.success(upcomingResponse))
                    case let .failure(error):
                        completion(.failure(error))
                }
            }
        }
    }
}
