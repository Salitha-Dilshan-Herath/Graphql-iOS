//
//  ProfileService.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import Foundation

protocol ProfileViewDelegate: NSObjectProtocol {
    
    func displayUserData(user: User?, error: CustomErrors?)
    func displayPinnedRepos(repo: PinnedRepos?, error: CustomErrors?)
    func displayStarredRepos(repo: StarredRepos?, error: CustomErrors?)
    func displayTopRepos(repo: TopRepos?, error: CustomErrors?)
}


class ProfileService {
    
    func getUserData(userName:(String), completion: @escaping (Result<User, CustomErrors>) -> Void) {

        if let cacheObject = CacheManager.getObject (key: userName), let userObject = cacheObject.user {
            
            completion(.success(userObject))
            
        } else {
            
            completion(.failure(.unableToComplete))
            
        }
    }
    
    func getPinnedRepos(userName:(String), completion: @escaping (Result<PinnedRepos, CustomErrors>) -> Void) {

        ApolloRequest.getPinnedRepos(name: userName) {
            result in
            
            switch result {
            
            case .success(let data):
                
                completion(.success(data))


            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
    
    func getStarredRepos(userName:(String), completion: @escaping (Result<StarredRepos, CustomErrors>) -> Void) {

        ApolloRequest.getStarredRepos(name: userName) {
            result in
            
            switch result {
            
            case .success(let data):
                
                completion(.success(data))


            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
    
    func getTopRepos(userName:(String), completion: @escaping (Result<TopRepos, CustomErrors>) -> Void) {

        ApolloRequest.getTopRepos(name: userName) {
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
