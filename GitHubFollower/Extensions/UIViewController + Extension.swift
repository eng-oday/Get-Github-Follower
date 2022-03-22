//
//  UIViewController + Extension.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 13/03/2022.
//

import UIKit

//fileprivate var containerView: UIView = UIView()
fileprivate var containerView: UIView!


extension UIViewController {
    
    func presentGFalertOnMainThread(title:String,message:String,buttonTitle:String){
        
        DispatchQueue.main.async {
            
            let alertVc                     = GFAlertVC(tittleLabel: title, message: message, buttonTittle: buttonTitle)
            alertVc.modalPresentationStyle  = .overFullScreen
            alertVc.modalTransitionStyle    = .crossDissolve
           
            self.present(alertVc, animated: true)
            
        }
        
    }
    
    func ShowLoadingView(){
        
        
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
  
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()

        
    }
    
    func DismissLoadingView(){

        DispatchQueue.main.async {
            containerView.removeFromSuperview()
                    }
    }
    
    
    func ShowEmptyState(message: String , view: UIView){
        
        let EmptyStateView = GFEmptyStateView(message: message)
        EmptyStateView.frame = view.bounds
        view.addSubview(EmptyStateView)
                
    }

    
}
