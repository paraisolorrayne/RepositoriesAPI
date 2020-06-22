//
//  DetailGatewaySetup.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 01/06/20.
//

import Foundation
enum DetailGatewaySetup: ClientSetup {
    case readme(fullName: String)
    
    var endpoint: String {
        switch self {
            case .readme(let fullName):
                return getReadmeRepositories("repos/\(fullName)/contents/README.md?ref=master")
        }
    }
    
    private func getReadmeRepositories(_ url: String) -> String {
        let urlComponents = URLComponents(string: url)
        guard let urlString = urlComponents?.url?.absoluteString else { return url }
        return urlString
    }
}
