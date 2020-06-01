//  
//  HomeModel.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import Foundation
import UIKit

struct Repositories: Codable {
    let incompleteResults : Bool?
    let items : [RepositoriesItems]
    let totalCount : Int
    
    enum CodingKeys: String, CodingKey {
        case incompleteResults = "incomplete_results"
        case items = "items"
        case totalCount = "total_count"
    }
}

struct RepositoriesItems: Codable {
    let name: String
    let fullName: String
    let stars: Int
    let owner: RepositoriesOwners
    
    enum CodingKeys: String, CodingKey {
        case name, owner
        case fullName = "full_name"
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
