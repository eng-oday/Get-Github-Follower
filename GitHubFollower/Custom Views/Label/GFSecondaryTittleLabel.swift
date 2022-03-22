//
//  GFSecondaryTittleLabel.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 16/03/2022.
//

import UIKit

class GFSecondaryTittleLabel: UILabel {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize:CGFloat) {
        self.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    private func configure(){
        
        translatesAutoresizingMaskIntoConstraints    = false
        textColor                                    = .secondaryLabel
        adjustsFontSizeToFitWidth                    = true
        minimumScaleFactor                           = 0.9
        lineBreakMode                                = .byTruncatingTail
        
    }

}
