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
                return "https://api.github.com/repos/\(fullName)/contents/README.md?ref=master"
        }
    }
}
