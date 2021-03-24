//
//  ProfileVC.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import UIKit
import SDWebImage

class ProfileVC: UIViewController, ProfileViewDelegate {
    
    
    //MARK: - @IBOutlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var lblFollowing: UILabel!
    

    //MARK: - Variables
    var userName = ""
    private let profilePresenter = ProfilePresenter(profileService: ProfileService())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Custom Methods
    func setupUI()  {
        
        imgUser.layer.cornerRadius  = self.imgUser.frame.height / 2
        imgUser.sd_imageIndicator   = SDWebImageActivityIndicator.gray

        profilePresenter.setViewDelegate(profileViewDelegate: self)
        profilePresenter.getUserData(name: userName)

    }
    
    
    func displayUserData(user: User?, error: CustomErrors?) {
        
        print("profile load \(user!)")
        guard let data = user else {return}
        
        lblName.text  = data.name
        lblLogin.text = data.login
        
        if let imageURL = URL(string: data.avatarUrl)  {
            imgUser.sd_setImage(with: imageURL)
        }
        
        if data.email.isEmpty {
            lblEmail.text     = "Email: N/A"

        } else {
            lblEmail.text     = data.email

        }
        
        var fullString = "\(data.followers.totalCount) followers"
        var countRange = (fullString as NSString).range(of: "\(data.followers.totalCount)")

        var attributedString = NSMutableAttributedString(string: fullString, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
        attributedString.setAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)], range: countRange)
        
        lblFollowers.attributedText = attributedString

        
        fullString = "\(data.following.totalCount) following"
        countRange = (fullString as NSString).range(of: "\(data.following.totalCount)")
        
        attributedString = NSMutableAttributedString(string: fullString, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
       attributedString.setAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)], range: countRange)
        
        lblFollowing.attributedText = attributedString
    }

}
