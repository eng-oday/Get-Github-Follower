//
//  GFImageView.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 14/03/2022.
//

import UIKit

class GFImageView: UIImageView {
    
    let imagePlaceHolder    = UIImage(named: "avatar-placeholder")
    let cahse               = NetworkManager.shared.cashe
    
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
        
        // to check if image cahsed before dont download it aggain
        let cahseKey = NSString(string: imageURL)
        
        if let image = cahse.object(forKey: cahseKey) {
            self.image = image
            return
        }
        NetworkManager.shared.downloadImageView(from: imageURL) { [weak self] image in
            guard let self = self else {return}
            DispatchQueue.main.async {self.image = image}
        }
        
    }
    
}
