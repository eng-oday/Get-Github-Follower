//
//  GetFollowerBtn.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 12/03/2022.
//

import UIKit

class GFButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(backGroundColor:UIColor,Tittle:String){
        super.init(frame: .zero)
        self.backgroundColor = backGroundColor
        self.setTitle(Tittle, for: .normal)
        Configure()
        
    }
    
    private func Configure(){
        
        layer.cornerRadius                              = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font                                = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints       = false
        
    }

}