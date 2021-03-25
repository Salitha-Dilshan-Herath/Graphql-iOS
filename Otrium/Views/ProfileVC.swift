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
    @IBOutlet weak var tblPinned: UITableView!
    @IBOutlet weak var consrtarintHeightTblPinned: NSLayoutConstraint!
    @IBOutlet weak var clvTop: UICollectionView!
    @IBOutlet weak var clvStarred: UICollectionView!
    
    //MARK: - Variables
    var userName = ""
    var logUser: User?
    var pinnedRepos = [Edge]()
    var starredRepos = [Edge]()
    var topRepos = [Edge]()

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
        

        tblPinned.register(UINib(nibName: "Pinned", bundle: nil), forCellReuseIdentifier: "pinned")
        tblPinned.tableFooterView = UIView()
        
        clvTop.register(UINib(nibName: "RepoCVC", bundle: nil), forCellWithReuseIdentifier: "repo")
        clvStarred.register(UINib(nibName: "RepoCVC", bundle: nil), forCellWithReuseIdentifier: "repo")

        //MARK: Category Collection View Flow layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        clvTop!.collectionViewLayout = layout
        clvStarred!.collectionViewLayout = layout

        consrtarintHeightTblPinned.constant = 200 * 3
        
        imgUser.layer.cornerRadius  = self.imgUser.frame.height / 2
        imgUser.sd_imageIndicator   = SDWebImageActivityIndicator.gray
        

        profilePresenter.setViewDelegate(profileViewDelegate: self)
        profilePresenter.getUserData(name: userName)
        profilePresenter.getPinnedRepos(name: userName)
        profilePresenter.getTopRepos(name: userName)
        profilePresenter.getStarredRepos(name: userName)

    }
    
    
    func displayUserData(user: User?, error: CustomErrors?) {
        
        //print("profile load \(user!)")
        guard let data = user else {return}
        
        self.logUser  = user
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
    
    func displayPinnedRepos(repo: PinnedRepos?, error: CustomErrors?) {
        
        print("displayPinnedRepos")
        if repo != nil {
            
            self.pinnedRepos = repo!.itemShowcase.items.edges
            self.consrtarintHeightTblPinned.constant = CGFloat(200 * repo!.itemShowcase.items.edges.count)
            self.tblPinned.reloadData()
            self.clvTop.reloadData()
            self.clvStarred.reloadData()

        }else {
            Alert.showMessage(msg: error!.rawValue, on: self)
        }
    }

    func displayStarredRepos(repo: StarredRepos?, error: CustomErrors?) {
        
        if repo != nil {
            
            self.starredRepos = repo!.edges
            self.clvStarred.reloadData()

        }else {
            Alert.showMessage(msg: error!.rawValue, on: self)
        }
    }
    
    func displayTopRepos(repo: TopRepos?, error: CustomErrors?) {
        
        if repo != nil {
            
            self.topRepos = repo!.edges
            self.clvTop.reloadData()

        }else {
            Alert.showMessage(msg: error!.rawValue, on: self)
        }
        
    }
}
