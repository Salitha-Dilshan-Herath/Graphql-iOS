//
//  Request.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-24.
//

import Foundation


enum CustomErrors: String, Error {
    
    case invalidResponse  = "Invalid response from server. Please try again."
    case unableToComplete = "Unable to complete your request. Something went wrong."
    case invalidUsername  = "Invalid username or password. Please try again."
    case unableToUpdateCardDetail  = "Unable to update your card details."

}

struct ApolloRequest {
    
    static func getUserData(name: String, completion: @escaping (Result<User, CustomErrors>)->Void)  {
        
        Network.shared.apollo.fetch(query: UserQuery(name: name) ) { result in
            
            switch result {
            
            case .success(let gResult):
                
                do {
                    
                    if let result_data = gResult.data {
                        
                        let data = try JSONSerialization.data(withJSONObject: result_data.user!.jsonObject, options: .prettyPrinted)
                        
                        let result =  try JSONDecoder().decode(User.self, from: data)
                        completion(.success(result))
                    }
                    
                }
                catch _ {
                    
                    completion(.failure(.invalidResponse))

                }
                
                
            case .failure( _):
                
                completion(.failure(.unableToComplete))
            }
        }
        
    }
    
}
