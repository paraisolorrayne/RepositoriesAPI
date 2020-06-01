//
//  DetailPath.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 01/06/20.
//

import Foundation

struct DetailPath: Codable {
    
    let link_self: String?
    let git: String?
    let html: String?
    
    enum CodingKeys: String, CodingKey {
        case link_self = "self"
        case git = "git"
        case html = "html"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        link_self = try values.decodeIfPresent(String.self, forKey: .link_self)
        git = try values.decodeIfPresent(String.self, forKey: .git)
        html = try values.decodeIfPresent(String.self, forKey: .html)
    }
    
}
