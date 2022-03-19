//
//  FavoriteTableViewCell.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 18/03/2022.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    
    static let identifier = "cell"

    let profileImage = GFImageView(frame: .zero)
    let userLabel = GFTittleLabel(textAlignment: .left, fontSize: 18)
    
    
  
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
         configure()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Set(for username: String , imageUrl: String )
    {

        NetworkManager.shared.downloadImageView(from:imageUrl) { [weak self]result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.profileImage.image = result
            }
        }
        userLabel.text = username
        configure()
        
    }
    
    func configure(){
        
        addSubview(profileImage)
        addSubview(userLabel)
        
        accessoryType = .disclosureIndicator
        
        let padding: CGFloat = 12
        
    NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            
            userLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 24),
            userLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            userLabel.heightAnchor.constraint(equalToConstant: 20)
        
        
        ])    }

    
    
}
