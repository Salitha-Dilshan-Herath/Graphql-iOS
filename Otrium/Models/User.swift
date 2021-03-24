//
//  User.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-24.
//

import Foundation

struct User: Codable {
    
    let avatarUrl: String
    let bio: String
    let email: String
    let login: String
    let followers: UserFollowers
    let following: UserFollowing
    
}


struct UserFollowers: Codable {
    
    let totalCount: Int
}

struct UserFollowing: Codable {
    
    let totalCount: Int
}
