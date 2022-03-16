//
//  GFFollowerItemVC.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 16/03/2022.
//

import UIKit

class GFFollowerItemVC:GFItemInfoVC {

    
    var user:User!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    init(user:User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   private func configure(){
        
       itemInfoOne.set(itemInfoType: .follower, to: user.followers)
       itemInfoTwo.set(itemInfoType: .following, to: user.following)
       actionButton.set(backGroundColor: .systemGreen, tittle: "Get Following")
    }
    
}
