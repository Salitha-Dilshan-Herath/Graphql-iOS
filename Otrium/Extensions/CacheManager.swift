//
//  CasheManager.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-24.
//

import Foundation

struct CacheManager {
    
    private static var userDefaults = UserDefaults.standard
    private static let encoder = JSONEncoder()
    private static let decoder = JSONDecoder()
    
    
    
    static func saveObject(data: UserAllData, key: String)  {
        
        do {
            
            let en_data = try encoder.encode(data)
            userDefaults.set(en_data, forKey: key)
            userDefaults.synchronize()
            
        } catch {
            print("Unable to Encode (\(error))")
        }
    }
    
    
    static func getObject(key: String) -> UserAllData? {
        
        if let data = userDefaults.data(forKey: key) {
            
            do {
                
                let obj = try decoder.decode(UserAllData.self, from: data)
                
                let diff = Calendar.current.dateComponents([.day], from: obj.dateTime, to: Date()).day ?? 0
                
                if diff >= 1 {
                    print("is expired")
                    return nil
                } else {
                    return obj
                }
                
            } catch {
                print("Unable to Decode (\(error))")
                
                return nil
                
            }
        }
        
        return nil
    }
    
    
    
    static func removeObject(key: String) {
        
        userDefaults.removeObject(forKey: key)
    }
    
}
