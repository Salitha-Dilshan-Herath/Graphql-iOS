//
//  ProfileVCSetup.swift
//  Otrium
//
//  Created by Spemai-Macbook on 2021-03-25.
//

import Foundation
import UIKit

extension NewProfileVC {
    
    
    func setupConstraint()  {
        
        ///MARK: - Setup scroll view
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(topicView)
        scrollViewContainer.addArrangedSubview(userDataView)
        scrollViewContainer.addArrangedSubview(contentView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive   = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive     = true
        
        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive   = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive           = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive     = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive       = true
        
        ///MARK: - Setup topic view
        topicView.addSubview(labelProfile)
        labelProfile.centerYAnchor.constraint(equalTo: topicView.centerYAnchor).isActive = true
        labelProfile.centerXAnchor.constraint(equalTo: topicView.centerXAnchor).isActive = true
        
        ///MARK: - Setup user data view
        userDataView.addSubview(imageBackView)
        imageBackView.leadingAnchor.constraint(equalTo: userDataView.leadingAnchor).isActive = true
        imageBackView.topAnchor.constraint(equalTo: userDataView.topAnchor).isActive           = true
        imageBackView.bottomAnchor.constraint(equalTo: userDataView.bottomAnchor).isActive     = true
        imageBackView.widthAnchor.constraint(equalTo: userDataView.widthAnchor, multiplier: 1/3).isActive = true

        userDataView.addSubview(userDataBackView)
        userDataBackView.leadingAnchor.constraint(equalTo: imageBackView.trailingAnchor).isActive = true
        userDataBackView.topAnchor.constraint(equalTo: userDataView.topAnchor).isActive           = true
        userDataBackView.bottomAnchor.constraint(equalTo: userDataView.bottomAnchor).isActive     = true
        userDataBackView.trailingAnchor.constraint(equalTo: userDataView.trailingAnchor).isActive = true
        
        imageBackView.addSubview(userImage)
        userImage.centerYAnchor.constraint(equalTo: imageBackView.centerYAnchor).isActive = true
        userImage.centerXAnchor.constraint(equalTo: imageBackView.centerXAnchor).isActive = true
        userImage.widthAnchor.constraint(equalTo: imageBackView.widthAnchor, multiplier: 1/1.5).isActive = true
        userImage.heightAnchor.constraint(equalTo: imageBackView.heightAnchor, multiplier: 1/1.5).isActive = true
        
        userDataBackView.addSubview(userDataLabelBackView)
        userDataLabelBackView.leadingAnchor.constraint(equalTo: userDataBackView.leadingAnchor).isActive   = true
        userDataLabelBackView.trailingAnchor.constraint(equalTo: userDataBackView.trailingAnchor).isActive = true
        userDataLabelBackView.centerYAnchor.constraint(equalTo: userDataBackView.centerYAnchor).isActive   = true
        userDataLabelBackView.heightAnchor.constraint(equalTo: userDataBackView.heightAnchor, multiplier: 1/2).isActive = true

        userDataLabelBackView.addSubview(lblUsername)
        lblUsername.leadingAnchor.constraint(equalTo: userDataLabelBackView.leadingAnchor).isActive     = true
        lblUsername.trailingAnchor.constraint(equalTo: userDataLabelBackView.trailingAnchor).isActive   = true
        lblUsername.centerXAnchor.constraint(equalTo: userDataLabelBackView.centerXAnchor).isActive     = true
        lblUsername.heightAnchor.constraint(equalTo: userDataLabelBackView.heightAnchor, multiplier: 1/1.5).isActive = true
        
        userDataLabelBackView.addSubview(lblLogin)
        lblLogin.leadingAnchor.constraint(equalTo: userDataLabelBackView.leadingAnchor).isActive   = true
        lblLogin.trailingAnchor.constraint(equalTo: userDataLabelBackView.trailingAnchor).isActive = true
        lblLogin.topAnchor.constraint(equalTo: lblUsername.bottomAnchor).isActive                  = true
        lblLogin.bottomAnchor.constraint(equalTo: userDataLabelBackView.bottomAnchor).isActive     = true
        
        
        ///MARK: - Setup email label
        contentView.addSubview(lblEmail)
        lblEmail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive   = true
        lblEmail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        ///MARK: - Setup follow view
        contentView.addSubview(followView)
        followView.topAnchor.constraint(equalTo: lblEmail.bottomAnchor).isActive   = true
        followView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive   = true
        followView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        followView.addSubview(lblFollowers)
        lblFollowers.leadingAnchor.constraint(equalTo: followView.leadingAnchor).isActive = true
        lblFollowers.topAnchor.constraint(equalTo: followView.topAnchor).isActive   = true
        lblFollowers.bottomAnchor.constraint(equalTo: followView.bottomAnchor).isActive   = true
        lblFollowers.widthAnchor.constraint(equalTo: followView.widthAnchor, multiplier: 1/2.5).isActive = true

        followView.addSubview(lblFollowing)
        lblFollowing.topAnchor.constraint(equalTo: followView.topAnchor).isActive            = true
        lblFollowing.bottomAnchor.constraint(equalTo: followView.bottomAnchor).isActive      = true
        lblFollowing.leadingAnchor.constraint(equalTo: lblFollowers.trailingAnchor).isActive = true
        lblFollowing.trailingAnchor.constraint(equalTo: followView.trailingAnchor).isActive  = true
        
        ///MARK: - Pinned Header
        contentView.addSubview(pinnedHeaderView)
        pinnedHeaderView.topAnchor.constraint(equalTo: followView.bottomAnchor).isActive = true
        pinnedHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive   = true
        pinnedHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        pinnedHeaderView.addSubview(labelPinned)
        labelPinned.topAnchor.constraint(equalTo: pinnedHeaderView.topAnchor).isActive = true
        labelPinned.bottomAnchor.constraint(equalTo: pinnedHeaderView.bottomAnchor).isActive = true
        labelPinned.leadingAnchor.constraint(equalTo: pinnedHeaderView.leadingAnchor).isActive = true
        labelPinned.trailingAnchor.constraint(equalTo: pinnedHeaderView.trailingAnchor).isActive = true

        ///MARK: - Pinned table
        contentView.addSubview(tblPinned)
        tblPinned.topAnchor.constraint(equalTo: pinnedHeaderView.bottomAnchor).isActive = true
        tblPinned.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive   = true
        tblPinned.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        ///MARK: - Top  Header
        contentView.addSubview(topHeaderView)
        topHeaderView.topAnchor.constraint(equalTo: tblPinned.bottomAnchor).isActive = true
        topHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive   = true
        topHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true

        topHeaderView.addSubview(labelTop)
        labelTop.topAnchor.constraint(equalTo: topHeaderView.topAnchor).isActive = true
        labelTop.bottomAnchor.constraint(equalTo: topHeaderView.bottomAnchor).isActive = true
        labelTop.leadingAnchor.constraint(equalTo: topHeaderView.leadingAnchor).isActive = true
        labelTop.trailingAnchor.constraint(equalTo: topHeaderView.trailingAnchor).isActive = true
        
        ///MARK: - top  collection
        contentView.addSubview(clvTop)
        clvTop.topAnchor.constraint(equalTo: topHeaderView.bottomAnchor).isActive = true
        clvTop.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive   = true
        clvTop.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true

        ///MARK: - Starred  Header
        contentView.addSubview(starredHeaderView)
        starredHeaderView.topAnchor.constraint(equalTo: clvTop.bottomAnchor).isActive = true
        starredHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive   = true
        starredHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true

        starredHeaderView.addSubview(labelStarred)
        labelStarred.topAnchor.constraint(equalTo: starredHeaderView.topAnchor).isActive = true
        labelStarred.bottomAnchor.constraint(equalTo: starredHeaderView.bottomAnchor).isActive = true
        labelStarred.leadingAnchor.constraint(equalTo: starredHeaderView.leadingAnchor).isActive = true
        labelStarred.trailingAnchor.constraint(equalTo: starredHeaderView.trailingAnchor).isActive = true

        ///MARK: - starred  collection
        contentView.addSubview(clvStarred)
        clvStarred.topAnchor.constraint(equalTo: starredHeaderView.bottomAnchor).isActive = true
        clvStarred.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive   = true
        clvStarred.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
}
