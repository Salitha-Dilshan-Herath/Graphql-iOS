//
//  NewProfileVC.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import UIKit
import SDWebImage

class NewProfileVC: UIViewController, ProfileViewDelegate {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topicView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    let userDataView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 130).isActive = true
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        return view
    }()
    
    let labelProfile: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name:"SourceSansPro-Bold",size:19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userDataBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let userDataLabelBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lblUsername: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name:"SourceSansPro-Bold",size:30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblLogin: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name:"SourceSansPro-Regular",size:17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblEmail: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name:"SourceSansPro-Regular",size:20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return label
    }()
    
    let followView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return view
    }()
    
    let lblFollowers: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name:"SourceSansPro-Regular",size:10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return label
    }()
    
    let lblFollowing: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name:"SourceSansPro-Regular",size:10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return label
    }()
    
    let pinnedHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()
    
    let labelPinned: UILabel = {
        let label = UILabel()
        label.text = "Pinned"
        label.font = UIFont(name:"SourceSansPro-Bold",size:24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return label
    }()
    
    let tblPinned: UITableView = {
        
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 600).isActive = true
        return view
        
    }()
    
    let topHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()
    
    let labelTop: UILabel = {
        let label = UILabel()
        label.text = "Top Repositories"
        label.font = UIFont(name:"SourceSansPro-Bold",size:24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return label
    }()
    
    let clvTop: UICollectionView = {
        
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 180).isActive = true
        view.backgroundColor = .white

        return view
        
    }()
    
    let starredHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()
    
    let labelStarred: UILabel = {
        
        let label = UILabel()
        label.text = "Starred Repositories"
        label.font = UIFont(name:"SourceSansPro-Bold",size:24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
        return label
    }()
    
    let clvStarred: UICollectionView = {
        
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 180).isActive = true
        view.backgroundColor = .white
        return view
        
    }()
    
    var refreshControl:UIRefreshControl!

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
    
 
    func setupUI()  {
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        
        setupConstraint()
        
        tblPinned.register(UINib(nibName: "Pinned", bundle: nil), forCellReuseIdentifier: "pinned")
        tblPinned.tableFooterView = UIView()
        
        clvTop.register(UINib(nibName: "RepoCVC", bundle: nil), forCellWithReuseIdentifier: "repo")
        clvStarred.register(UINib(nibName: "RepoCVC", bundle: nil), forCellWithReuseIdentifier: "repo")

        tblPinned.delegate = self
        tblPinned.dataSource = self
        tblPinned.tableFooterView = UIView()
        tblPinned.separatorStyle = .none
    
        clvTop.delegate = self
        clvTop.dataSource = self
        
        clvStarred.delegate = self
        clvStarred.dataSource = self
        
        //MARK: Category Collection View Flow layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        clvStarred.collectionViewLayout = layout

        
        let layouts = UICollectionViewFlowLayout()
        layouts.scrollDirection = .horizontal
        clvTop.setCollectionViewLayout(layout, animated: false)
        
        
        userImage.layer.cornerRadius  = 40
        userImage.clipsToBounds = true

        userImage.sd_imageIndicator   = SDWebImageActivityIndicator.gray
        

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
        lblUsername.text  = data.name
        lblLogin.text = data.login
        
        if let imageURL = URL(string: data.avatarUrl)  {
            userImage.sd_setImage(with: imageURL)
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
        
        if repo != nil {
            
            self.pinnedRepos = repo!.itemShowcase.items.edges
            self.tblPinned.reloadData()

        }else {
            Alert.showMessage(msg: error!.rawValue, on: self)
        }
    }
    
    func displayTopRepos(repo: TopRepos?, error: CustomErrors?) {
        
        if repo != nil {
            
            self.topRepos = repo!.edges
            self.clvTop.reloadData()
            self.clvTop.collectionViewLayout.invalidateLayout()
            self.clvTop.layoutSubviews()
            

        }else {
            Alert.showMessage(msg: error!.rawValue, on: self)
        }
        
    }

    func displayStarredRepos(repo: StarredRepos?, error: CustomErrors?) {
        
        if repo != nil {
            
            self.starredRepos = repo!.edges
            self.clvStarred.reloadData()
            self.clvStarred.collectionViewLayout.invalidateLayout()
            self.clvStarred.layoutSubviews()

        }else {
            Alert.showMessage(msg: error!.rawValue, on: self)
        }
    }
    
    @objc func refresh()
    {
        // Code to refresh table view
        refreshControl.endRefreshing()
        profilePresenter.getUserData(name: userName)
        profilePresenter.getPinnedRepos(name: userName)
        profilePresenter.getTopRepos(name: userName)
        profilePresenter.getStarredRepos(name: userName)
        
    }
}
