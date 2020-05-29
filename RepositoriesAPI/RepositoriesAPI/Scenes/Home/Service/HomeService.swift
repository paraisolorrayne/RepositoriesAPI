//  
//  HomeService.swift
//  RepositoriesAPI
//
//  Created by Lorrayne Paraiso on 29/05/20.
//

import Foundation
import Alamofire

class HomeService: HomeServiceProtocol {
    // Call protocol function

    func removeThisFuncName(success: @escaping(_ data: HomeModel) -> (), failure: @escaping() -> ()) {

        let url = ""

        APIManager.request(
            url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: [:],
            completion: { data in
                
                // mapping data
                do {
                    let decoded = try JSONDecoder().decode(HomeModel.self, from: data)
                    success()
                } catch _ {
                    failure()
                }
                
        }) { errorMsg, errorCode in
            failure()
        }

    }

}
