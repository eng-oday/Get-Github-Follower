//
//  GFReposItemVC.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 16/03/2022.
//

import UIKit

class GFReposItemVC:GFItemInfoVC {

    
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
        
       itemInfoOne.set(itemInfoType: .repos, to: user.public_repos)
       itemInfoTwo.set(itemInfoType: .gists, to: user.public_gists)
       actionButton.set(backGroundColor: .systemPurple, tittle: "GitHub Profile")
    }
    
}
