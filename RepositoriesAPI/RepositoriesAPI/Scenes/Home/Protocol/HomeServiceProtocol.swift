//  
//  HomeServiceProtocol.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import Foundation

protocol HomeServiceProtocol {

    func getSwiftRepositories(page: Int, language: String, completion: @escaping (Result<Repositories>) -> Void)

}
