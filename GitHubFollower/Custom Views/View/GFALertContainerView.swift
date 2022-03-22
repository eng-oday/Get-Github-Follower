//
//  GFALertContainerView.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 19/03/2022.
//

import UIKit

class GFALertContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configure(){
        
        
       layer.cornerRadius         = 16
       layer.borderWidth          = 2
       layer.borderColor          = UIColor.white.cgColor
       translatesAutoresizingMaskIntoConstraints = false
       backgroundColor = .systemBackground
        
    }
}
