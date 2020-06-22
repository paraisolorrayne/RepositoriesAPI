//
//  DetailService.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 01/06/20.
//

import Foundation

class DetailService: DetailServiceProtocol {
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
    
    func getReadmeRepositories(fullName: String, completion: @escaping (Result<DetailModel>) -> Void) {
        queue.addOperation { [weak self] in
            guard let gateway = self else { return }
            gateway.client.requestData(with: DetailGatewaySetup.readme(fullName: fullName)) { (result: Result<DetailModel>) in
                switch result {
                    case let .success(repositoryResponse):
                        completion(.success(repositoryResponse))
                    case let .failure(error):
                        completion(.failure(error))
                }
            }
        }
    }
}
