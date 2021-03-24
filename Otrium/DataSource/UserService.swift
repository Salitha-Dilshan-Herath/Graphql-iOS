//
//  UserService.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-24.
//

import Foundation

protocol UserViewDelegate: NSObjectProtocol {
    func displayUserData(user: User)
}

class UserService {
    
    func getUserData(userName:(String), completion: @escaping (User?) -> Void) {

       
        ApolloRequest.getUserData(name: userName) {
            result in
            
            switch result {
            
            case .success(let data):
                
                completion(data)
                
            case .failure(_):
                
                completion(nil)
            }
        }
        
    }
}
