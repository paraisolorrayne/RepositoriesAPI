//
//  Result.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(ClientError)
}

