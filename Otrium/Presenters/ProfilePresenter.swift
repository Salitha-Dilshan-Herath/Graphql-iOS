//
//  ProfilePresenter.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import Foundation

class ProfilePresenter {
    
    private let profileService:ProfileService
    weak private var profileViewDelegate : ProfileViewDelegate?
    
    init(profileService:ProfileService){
        
        self.profileService = profileService
    }
    
    func setViewDelegate(profileViewDelegate:ProfileViewDelegate?){
        
        self.profileViewDelegate = profileViewDelegate
    }
    
    func getUserData(name:String){

        
        profileService.getUserData(userName: name) {
            result in
            
            switch result {
            
            case .success(let data):
                
                self.profileViewDelegate?.displayUserData(user: data, error: nil)
                
            case .failure(let error):
                
                self.profileViewDelegate?.displayUserData(user: nil, error: error)

            }
            
        }
        
    }
}
