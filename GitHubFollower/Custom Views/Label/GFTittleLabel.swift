//
//  GFTittleLabel.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 13/03/2022.
//

import UIKit

class GFTittleLabel: UILabel {


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment , fontSize:CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure(){
        
        translatesAutoresizingMaskIntoConstraints    = false
        textColor                                    = .label
        adjustsFontSizeToFitWidth                    = true
        minimumScaleFactor                           = 0.9
        lineBreakMode                                = .byTruncatingTail
        
        
    }
    
}
