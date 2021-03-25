//
//  ProfileTopRepos.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import Foundation
import UIKit

extension NewProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if clvTop == collectionView {
            return self.topRepos.count

        }
        
        return self.starredRepos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "repo", for: indexPath) as! RepoCVC
        
        if clvStarred == collectionView {
            cell.setupCell(user: self.logUser!, repo: starredRepos[indexPath.row])

        } else  if clvTop == collectionView{
            cell.setupCell(user: self.logUser!, repo: topRepos[indexPath.row])

        }
        
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
                
        return CGSize(width: collectionView.frame.width / 1.5 , height: 150 )
        
    }
    
    
}

