//
//  Pinned.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import UIKit
import SDWebImage

class Pinned: UITableViewCell {

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
        
        viwBack.layer.cornerRadius = 8
        viwBack.layer.borderWidth  = 1
        viwBack.layer.borderColor  = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        self.imgUser.layer.cornerRadius = 25
        self.imgUser.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(user: User, repo: Edge)  {
        
        lblUserName.text = user.login
        
        if let imageURL = URL(string: user.avatarUrl)  {
            imgUser.sd_setImage(with: imageURL)
        }
        
        lblProjectName.text = repo.node.name
        lblProjectDescription.text = repo.node.description
        lblStarCount.text = "\(repo.node.stargazerCount)"
        
        if repo.node.primaryLanguage != nil {
            lblLan.text = "\(repo.node.primaryLanguage!.name)"
            imgLan.tintColor = UIExtensions.hexStringToUIColor(hex: repo.node.primaryLanguage!.color ?? "")
        }
    }
}
