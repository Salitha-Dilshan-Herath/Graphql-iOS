//
//  ProfileTopRepos.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import Foundation
import UIKit

extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if clvTop == collectionView {
            return pinnedRepos.count

        }
        
        
        return pinnedRepos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "repo", for: indexPath) as! RepoCVC
        
        
        cell.setupCell(user: self.logUser!, repo: pinnedRepos[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
                
        return CGSize(width: collectionView.frame.width / 1.5 , height: 150 )
        
    }
    
    
}

