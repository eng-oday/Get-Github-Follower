//
//  GFItemInfoView.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 16/03/2022.
//

import UIKit


enum itemInfoType{
    
    case repos,gists,follower,following
    
}

class GFItemInfoView: UIView {
    
    
    let itemImageView = UIImageView()
    let itemLable = GFTittleLabel(textAlignment: .left, fontSize: 16)
    let countLabel = GFTittleLabel(textAlignment: .center, fontSize: 16)
    
    
    
    override init(frame: CGRect) {
    super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private  func configure(){
        
        addSubview(itemImageView)
        addSubview(itemLable)
        addSubview(countLabel)
        
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.tintColor = .label
        itemImageView.contentMode = .scaleAspectFill
        
        
        NSLayoutConstraint.activate([
        
            itemImageView.topAnchor.constraint(equalTo: self.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemImageView.heightAnchor.constraint(equalToConstant: 20),
            itemImageView.widthAnchor.constraint(equalToConstant: 20),
            
            
            itemLable.centerYAnchor.constraint(equalTo:itemImageView.centerYAnchor),
            itemLable.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 8),
            itemLable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemLable.heightAnchor.constraint(equalToConstant: 18),
            
            
            countLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor , constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        
        ])
        
    }
    
    func set(itemInfoType:itemInfoType , to count : Int){
        
        
        switch itemInfoType {
        case .repos:
            itemImageView.image = UIImage(systemName: SFSymbols.repos)
            itemLable.text = "Public Repos"
        case .gists:
            itemImageView.image = UIImage(systemName: SFSymbols.gists)
            itemLable.text = "Public Gists"
        case .follower:
            itemImageView.image = UIImage(systemName: SFSymbols.follower)
            itemLable.text = "Follower"
        case .following:
            itemImageView.image = UIImage(systemName: SFSymbols.following)
            itemLable.text = "Following"
        }
        countLabel.text = String(count)
    }
    
    
    
    
}
