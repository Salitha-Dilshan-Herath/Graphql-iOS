//
//  ViewController.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-24.
//

import UIKit

class LoginVC: UIViewController, UserViewDelegate {
  
    //MARK: - @IBOutlets
    @IBOutlet weak var viwBackground: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    
    //MARK: - Variables
    private let userPresenter = UserPresenter(userService: UserService())
    private let progress = ProgressHUD(text: "Loading...")


    //MARK: - Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - @IBActions
    @IBAction func loginBtnTap(_ sender: Any) {
        
        guard let txt = txtUsername.text else {return}
        
        if txt.isEmpty {
            Alert.showMessage(msg: "Please enter github username", on: self)
            return
        }
        
        progress.show()
        userPresenter.getUserData(name: txt.trimmingCharacters(in: .whitespacesAndNewlines).lowercased())
        
    }
    
    //MARK: - Custom Methods
    func setupUI()  {
        
        userPresenter.setViewDelegate(userViewDelegate: self)
        
        viwBackground.layer.cornerRadius = 8
        btnLogin.layer.cornerRadius = 8
        
        progress.hide()
        view.addSubview(progress)

    }
    
    
    //MARK: - Delegate methods 
    func displayUserData(user: User? , error: CustomErrors?) {
        progress.hide()
       
        if user !=  nil{
            print(user!)
        } else {
            Alert.showMessage(msg: error!.rawValue, on: self)
        }
    }
    
}

