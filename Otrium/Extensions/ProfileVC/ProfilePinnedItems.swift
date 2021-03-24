//
//  ProfilePinnedItems.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import Foundation
import UIKit

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pinnedRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = tableView.dequeueReusableCell(withIdentifier: "pinned", for: indexPath) as! Pinned
        
        item.setupCell(user: self.logUser!, repo: pinnedRepos[indexPath.row])
        return item
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
