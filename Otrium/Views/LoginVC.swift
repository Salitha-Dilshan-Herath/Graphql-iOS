//
//  ViewController.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-24.
//

import UIKit

class LoginVC: UIViewController, UserViewDelegate {
  
    private let userPresenter = UserPresenter(userService: UserService())


    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPresenter.setViewDelegate(userViewDelegate: self)
        
        userPresenter.getUserData(name: "dilum1995")
    }
    
    func displayUserData(user: User) {
        print(user)
    }
    
}

