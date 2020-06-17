//
//  GatewaySetup.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import Foundation


enum GatewaySetup: ClientSetup {
    case search(page: Int, language: String)
    
    var endpoint: String {
        switch self {
            case .search(let page, let language):
                return getSwiftRepositories("https://api.github.com" + "/search/repositories",
                                            page: page, language: language)
        }
    }
        
    private func getSwiftRepositories(_ url: String, page: Int, language: String) -> String {
        var urlComponents = URLComponents(string: url)
        let pageString = String(page)
        
        urlComponents?.queryItems = [URLQueryItem(name: "q", value: "language:\(language)"),
                                            URLQueryItem(name: "sort", value: "stars"),
                                            URLQueryItem(name: "page", value: pageString)]

        
        guard let urlString = urlComponents?.url?.absoluteString else { return url }
        return urlString
    }
}
