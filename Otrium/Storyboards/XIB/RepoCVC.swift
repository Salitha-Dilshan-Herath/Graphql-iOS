//
//  repoCVC.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import UIKit

class RepoCVC: UICollectionViewCell {

    @IBOutlet weak var viwBack: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblProjectName: UILabel!
    @IBOutlet weak var lblProjectDescription: UILabel!
    @IBOutlet weak var lblStarCount: UILabel!
    @IBOutlet weak var lblLan: UILabel!
    @IBOutlet weak var imgLan: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viwBack.layer.cornerRadius = 8
        viwBack.layer.borderWidth  = 1
        viwBack.layer.borderColor  = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        imgUser.layer.cornerRadius = 20
        imgUser.clipsToBounds = true
    }

    func setupCell(user: User, repo: Edge)  {
        
        lblUserName.text = user.login
        
        if let imageURL = URL(string: user.avatarUrl)  {
            imgUser.sd_setImage(with: imageURL)
        }
        
        lblProjectName.text = repo.node.name
        lblProjectDescription.text = repo.node.description
        lblStarCount.text = "\(repo.node.stargazerCount)"
        
        if repo.node.languages.nodes.count > 0 {
            lblLan.text = "\(repo.node.languages.nodes[0].name)"
            imgLan.tintColor = UIExtensions.hexStringToUIColor(hex: repo.node.languages.nodes[0].color)
        }
        
    }
}
