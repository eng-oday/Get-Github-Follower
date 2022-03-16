//
//  GFItemInfoVC.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 16/03/2022.
//

import UIKit

class GFItemInfoVC: UIViewController {

    let stackView = UIStackView()
    let itemInfoOne = GFItemInfoView()
    let itemInfoTwo = GFItemInfoView()
    let actionButton = GFButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        LayoutUI()
        configureStackView()
        

    }
    
    private func configureViewController(){
        
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 18
        
    }
    

    private func LayoutUI(){
        
        view.addSubview(stackView)
        view.addSubview(actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding:CGFloat = 20
        
        
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: padding),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        
        ])
        
    }
    
    func configureStackView(){
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(itemInfoOne)
        stackView.addArrangedSubview(itemInfoTwo)
        
        
        
    }
    
    
}
