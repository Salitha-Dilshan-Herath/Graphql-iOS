//
//  UserAllData.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import Foundation

class UserAllData: Codable {
    
    var user: User?
    var dateTime: Date
    
    init(user: User, dateTime: Date) {
        
        self.user = user
        self.dateTime = dateTime
        print("save time \(dateTime)")
    }
}
