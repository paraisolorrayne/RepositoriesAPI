//
//  GatewaySetup.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import Foundation


enum GatewaySetup: ClientSetup {
    case search(page: Int)
    
    var endpoint: String {
        switch self {
            case .search(let page):
                return getSwiftRepositories("https://api.github.com" + "/search/repositories",
                                                 page: page)
        }
    }
        
    private func getSwiftRepositories(_ url: String, page: Int) -> String {
        var urlComponents = URLComponents(string: url)
        let pageString = String(page)
        
        urlComponents?.queryItems = [URLQueryItem(name: "q", value: "language:swift"),
                                            URLQueryItem(name: "sort", value: "stars"),
                                            URLQueryItem(name: "page", value: pageString)]

        
        guard let urlString = urlComponents?.url?.absoluteString else { return url }
        return urlString
    }
}
