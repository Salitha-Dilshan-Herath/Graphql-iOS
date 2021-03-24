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

       
        ApolloRequest.getUserData(name: userName) {
            result in
            
            switch result {
            
            case .success(let data):
                
                completion(.success(data))

            case .failure(let error):
                
                completion(.failure(error))
            }
        }
        
    }
}
