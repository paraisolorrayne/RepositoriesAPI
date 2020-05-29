//  
//  HomeModel.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import Foundation
import UIKit

struct Repositories: Codable {
    let items: [RepositoriesItems]
}

struct RepositoriesItems: Codable {
    let name: String
    let stars: Int
    let owner: RepositoriesOwners
    
    enum CodingKeys: String, CodingKey {
        case name, owner
        case stars = "stargazers_count"
    }
}

struct RepositoriesOwners: Codable {
    let ownerImage, ownerName: String
    
    enum CodingKeys: String, CodingKey {
        case ownerImage = "avatar_url"
        case ownerName = "login"
    }
}
