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
    case invalidUsername  = "Invalid username. Please try again."

}

struct ApolloRequest {
    
    static func getUserData(name: String, completion: @escaping (Result<User, CustomErrors>)->Void)  {
        
        Network.shared.apollo.fetch(query: UserQuery(name: name) ) { result in
            
            switch result {
            
            case .success(let gResult):
                
                do {
                    
                    if let result_data = gResult.data {
                        
                        guard let user_data = result_data.user else {
                            completion(.failure(.invalidUsername))
                            return
                            
                        }
                        
                        //print(user_data)
                        let data = try JSONSerialization.data(withJSONObject: user_data.jsonObject, options: .prettyPrinted)
                        
                        let result =  try JSONDecoder().decode(User.self, from: data)
                        completion(.success(result))
                    }
                    
                }
                catch (let error){
                    print(error)
                    completion(.failure(.invalidResponse))

                }
                
                
            case .failure(let error):
                
                print(error)
                completion(.failure(.unableToComplete))
            }
        }
        
    }
    
    static func getPinnedRepos(name: String, completion: @escaping (Result<PinnedRepos, CustomErrors>)->Void)  {
        
        Network.shared.apollo.fetch(query: UserPinnedReposQuery(name: name) ) { result in
            
            switch result {
            
            case .success(let gResult):
                
                do {
                    
                    if let result_data = gResult.data {
                        
                        guard let user_repo = result_data.repositoryOwner else {
                            completion(.failure(.invalidUsername))
                            return
                            
                        }
                        
                       //print(user_repo)
                        let data = try JSONSerialization.data(withJSONObject: user_repo.jsonObject, options: .prettyPrinted)
                        
                        let result =  try JSONDecoder().decode(PinnedRepos.self, from: data)
                        completion(.success(result))
                    }
                    
                }
                catch (let error){
                    print(error)
                    completion(.failure(.invalidResponse))

                }
                
                
            case .failure(let error):
                
                print(error)
                completion(.failure(.unableToComplete))
            }
        }
        
    }
    
}
