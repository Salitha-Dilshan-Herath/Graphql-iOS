//
//  File.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import Foundation

struct PinnedRepos: Codable {
    
    let itemShowcase: ItemShowcase
    
}

struct ItemShowcase: Codable {
    
    let items: Items
}

struct Items: Codable {
   
    let edges:[Edge]
}

struct Edge: Codable {
   
    let node: Nodes
}


struct Nodes: Codable {
    
    let name: String
    let description: String?
    let stargazerCount: Int
    let primaryLanguage: LanguagesNodes?

}

struct LanguagesNodes:Codable {
    let name:String
    let color: String?
}
