//
//  FollowerCell.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 14/03/2022.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let identifier = "FollowerCell"
    
    let profileImage = GFImageView(frame: .zero)
    let userLabel = GFTittleLabel(textAlignment: .center, fontSize: 16)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetFollower(follower:Follower){
        
        userLabel.text = follower.login
        profileImage.getimage(from: follower.avatar_url)
        
    }
    
    
    private func configure(){
        addSubviews(profileImage,userLabel)
 
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            profileImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
           
            userLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 12),
            userLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            userLabel.heightAnchor.constraint(equalToConstant: 20)
            
            
            
        
        ])
        
    }
    
    
    
}
