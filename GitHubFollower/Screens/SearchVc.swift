//
//  ViewController.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 12/03/2022.
//

import UIKit

class SearchVc: UIViewController {
    
    let logoImageView = UIImageView()
    let userNameTextField = GFTextField()
    let callToActionBtn = GFButton(backGroundColor: .systemGreen, Tittle: "Get Followers")

    var isUserNameEmpty:Bool {
        return userNameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        view.backgroundColor = .systemBackground
        view.addSubviews(logoImageView,userNameTextField,callToActionBtn)
        ConfigureLogoImageView()
        ConfigureTextField()
        configureGFButton()
        CreateDismissKeyboardTapGesture()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func CreateDismissKeyboardTapGesture(){
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    func ConfigureLogoImageView(){
        
        logoImageView.translatesAutoresizingMaskIntoConstraints     = false
        logoImageView.image                                         = Images.ghLogo
        
        //set constraints to logo image
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 88),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    func ConfigureTextField(){
        
        userNameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func configureGFButton(){
        
        
        callToActionBtn.addTarget(self, action: #selector(PushFollowerListVc), for: .touchUpInside)

        NSLayoutConstraint.activate([
        callToActionBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
        callToActionBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        callToActionBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        callToActionBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
    }
    
    @objc func PushFollowerListVc(){
        
        if isUserNameEmpty{
    
            presentGFalertOnMainThread(
                title: "unvaild user name",
                message: "please enter user name we need to know who look for ????.",
                buttonTitle: "OK"
            )
        
        }
        else
        {
            userNameTextField.resignFirstResponder()
            let followerVc                                      = FollowerListVc(userName: userNameTextField.text!)
            followerVc.navigationItem.largeTitleDisplayMode     = .always
            navigationController?.pushViewController(followerVc, animated: true)
        }
        
        
    }
    
}

extension SearchVc : UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     PushFollowerListVc()
        return true
    }
    
    
}
