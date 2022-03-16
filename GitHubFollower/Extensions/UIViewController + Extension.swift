//
//  UIViewController + Extension.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 13/03/2022.
//

import UIKit


extension UIViewController {
    
    func presentGFalertOnMainThread(title:String,message:String,buttonTitle:String){
        
        DispatchQueue.main.async {
            
            let alertVc = GFAlertVC(tittleLabel: title, message: message, buttonTittle: buttonTitle)
            alertVc.modalPresentationStyle  = .overFullScreen
            alertVc.modalTransitionStyle    = .crossDissolve
           
            self.present(alertVc, animated: true)
            
        }
        
    }
    
    
    
}
