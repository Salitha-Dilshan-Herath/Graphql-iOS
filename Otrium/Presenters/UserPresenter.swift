//
//  UserPresenter.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-24.
//

import Foundation

class UserPresenter {
    
    private let userService:UserService
    weak private var userViewDelegate : UserViewDelegate?
    
    init(userService:UserService){
        
        self.userService = userService
    }
    
    func setViewDelegate(userViewDelegate:UserViewDelegate?){
        
        self.userViewDelegate = userViewDelegate
    }
    
    func getUserData(name:String){

        
        userService.getUserData(userName: name) {
            result in
            
            switch result {
            
            case .success(let data):
                
                self.userViewDelegate?.displayUserData(user: data, error: nil)
                
            case .failure(let error):
                
                self.userViewDelegate?.displayUserData(user: nil, error: error)

            }
            
        }
        
    }
}
