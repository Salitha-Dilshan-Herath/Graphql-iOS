//
//  ProfileService.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import Foundation

protocol ProfileViewDelegate: NSObjectProtocol {
    
    func displayUserData(user: User?, error: CustomErrors?)
    
}


class ProfileService {
    
    func getUserData(userName:(String), completion: @escaping (Result<User, CustomErrors>) -> Void) {

        if let cacheObject = CacheManager.getObject (key: userName), let userObject = cacheObject.user {
            
            completion(.success(userObject))
            
        } else {
            
            completion(.failure(.unableToComplete))
            
        }
    }
}
