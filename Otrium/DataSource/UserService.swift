//
//  UserService.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-24.
//

import Foundation

protocol UserViewDelegate: NSObjectProtocol {
    
    func displayUserData(user: User?, error: CustomErrors?)
    
}

class UserService {
    
    func getUserData(userName:(String), completion: @escaping (Result<User, CustomErrors>) -> Void) {

        if let cacheObject = CacheManager.getObject (key: userName), let userObject = cacheObject.user {
            
            print("call cache")

            completion(.success(userObject))
            
        } else {
            
            ApolloRequest.getUserData(name: userName) {
                result in
                
                switch result {
                
                case .success(let data):
                    
                    print("call save")
                    CacheManager.saveObject(data: UserAllData(user: data, dateTime: Date()), key: userName)

                    completion(.success(data))


                case .failure(let error):
                    
                    completion(.failure(error))
                }
            }
            
        }
    }
}
