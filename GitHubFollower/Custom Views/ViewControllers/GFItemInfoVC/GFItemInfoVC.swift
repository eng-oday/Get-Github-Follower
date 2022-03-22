//
//  GFItemInfoVC.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 16/03/2022.
//

import UIKit



protocol GFItemInfoVCDelegate: AnyObject {
    
    func didTapGithubProfileItem(user:User)
    func didTapGetFollowerItem(user:User)
    
}

class GFItemInfoVC: UIViewController {

    let stackView = UIStackView()
    let itemInfoOne = GFItemInfoView()
    let itemInfoTwo = GFItemInfoView()
    let actionButton = GFButton()
    
    var delegate:GFItemInfoVCDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureActionBtn()
        LayoutUI()
        configureStackView()
        

    }
    
    private func configureViewController(){
        
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 18
        
    }
    
    func configureActionBtn(){
        
        actionButton.addTarget(self, action: #selector(actionBtnDidTapped), for: .touchUpInside)
        
    }
    
    @objc func actionBtnDidTapped(){}
    
    

    private func LayoutUI(){
        view.addSubviews(stackView,actionButton)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding:CGFloat = 20
        
        
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
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
