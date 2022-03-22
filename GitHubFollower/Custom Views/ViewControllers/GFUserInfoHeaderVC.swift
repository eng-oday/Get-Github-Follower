//
//  GFUserInfoHeaderVC.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 16/03/2022.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    
    let avatarImageView = GFImageView(frame: .zero)
    let userNameLabel = GFTittleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTittleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTittleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        LayoutUI()
        ConfigurUserUI()
        
    }
    
    init(user:User) {
        
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        
        view.addSubviews(avatarImageView,userNameLabel,nameLabel,locationImageView,locationLabel,bioLabel)
  
    }
    
    private func ConfigurUserUI(){
        avatarImageView.getimage(from: user.avatar_url)
        userNameLabel.text              = user.login
        nameLabel.text                  = user.name ?? ""
        locationLabel.text              =   user.location ?? "NO LOCATION"
        locationImageView.image         = SFSymbols.location
        locationImageView.tintColor     = .secondaryLabel
        bioLabel.text                   = user.bio ?? "No Bio available"
        bioLabel.numberOfLines          = 3
        
        
        
        
    }
    
    private func LayoutUI(){
        
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 20
        let textImagePadding:CGFloat =  12
        
        
        NSLayoutConstraint.activate([
        
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            
            userNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
            
        
        ])
        
        
    }
    
    
    
    
}
