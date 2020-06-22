//
//  DetailServiceProtocol.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 01/06/20.
//

import Foundation
protocol DetailServiceProtocol {
    
    func getReadmeRepositories(fullName: String, completion: @escaping (Result<DetailModel>) -> Void)
    
}
