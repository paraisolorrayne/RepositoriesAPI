//  
//  HomeServiceProtocol.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import Foundation

protocol HomeServiceProtocol {

    func getSwiftRepositories(page: Int, completion: @escaping (Result<Repositories>) -> Void)

}
