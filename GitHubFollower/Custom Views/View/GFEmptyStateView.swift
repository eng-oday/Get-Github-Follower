//
//  GFEmptyStateView.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 15/03/2022.
//

import UIKit

class GFEmptyStateView: UIView {

    let emptyStateLabel = GFTittleLabel(textAlignment: .center, fontSize: 28)
    let emptyStateImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message:String) {
        super.init(frame: .zero)
        emptyStateLabel.text = message
        configure()
    }
    
    func configure(){
      addSubview(emptyStateImage) 
        addSubview(emptyStateLabel)
        
        emptyStateLabel.numberOfLines = 3
        emptyStateLabel.textColor = .secondaryLabel
        
        emptyStateImage.image = UIImage(named: "empty-state-logo")
        emptyStateImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emptyStateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            emptyStateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emptyStateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emptyStateLabel.heightAnchor.constraint(equalToConstant: 200),
            

            emptyStateImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            emptyStateImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            emptyStateImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 180),
            emptyStateImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
        ])
        
        
    }
}
