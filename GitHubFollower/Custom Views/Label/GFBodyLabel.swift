//
//  GFBodyLabel.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 13/03/2022.
//

import UIKit

class GFBodyLabel: UILabel {


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    private func configure(){
        
        translatesAutoresizingMaskIntoConstraints    = false
        textColor                                    = .secondaryLabel
        font                                         = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth                    = true
        minimumScaleFactor                           = 0.75
        lineBreakMode                                = .byWordWrapping
        
        
    }
    
}
