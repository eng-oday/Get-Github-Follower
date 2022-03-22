//
//  GFImageView.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 14/03/2022.
//

import UIKit

class GFImageView: UIImageView {
    
    let imagePlaceHolder    = Images.placeholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configure(){
        
        layer.cornerRadius = 10
        clipsToBounds = true
        image = imagePlaceHolder
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    func getimage(from imageURL:String){
        
        NetworkManager.shared.downloadImageView(from: imageURL) { [weak self] image in
            guard let self = self else {return}
            DispatchQueue.main.async {self.image = image}
        }
        
    }
    
}
