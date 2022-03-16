//
//  GFAlertVC.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 13/03/2022.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let container = UIView()
    let AlertTitleLabel = GFTittleLabel(textAlignment: .center, fontSize: 20)
    let AlertMessageLabel = GFBodyLabel(textAlignment: .center)
    let ActionButton = GFButton(backGroundColor: .systemPink, Tittle: "ok")
    
    var alertTittle:String?
    var mesasge:String?
    var buttonTittle:String?
    
    let padding:CGFloat = 20

    
    init(tittleLabel: String , message:String, buttonTittle:String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTittle = tittleLabel
        self.mesasge = message
        self.buttonTittle = buttonTittle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        ConfigureContainerView()
        ConfigureTittleLabel()
        ConfigureActionButton()
        ConfigureMessageLabel()
    }
    
    private func ConfigureContainerView(){
        
        view.addSubview(container)
        
        container.layer.cornerRadius         = 16
        container.layer.borderWidth          = 2
        container.layer.borderColor          = UIColor.white.cgColor
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
        
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalToConstant: 280),
            container.heightAnchor.constraint(equalToConstant: 220)
        ])
        
    }
    
    
    private func ConfigureTittleLabel(){
        
        container.addSubview(AlertTitleLabel)
        AlertTitleLabel.text = alertTittle ?? "Something Went Wrong ...."
      
        
        NSLayoutConstraint.activate([
            AlertTitleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: padding),
            AlertTitleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            AlertTitleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            AlertTitleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func ConfigureActionButton(){
        
        container.addSubview(ActionButton)
        ActionButton.setTitle(buttonTittle ?? "OK", for: .normal)
        ActionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            ActionButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -padding),
            ActionButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            ActionButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            ActionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func ConfigureMessageLabel(){
        
        container.addSubview(AlertMessageLabel)
        AlertMessageLabel.text = mesasge ?? "Unable To complete request ..."
        AlertMessageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            AlertMessageLabel.topAnchor.constraint(equalTo: AlertTitleLabel.bottomAnchor, constant: 8),
            AlertMessageLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            AlertMessageLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            AlertMessageLabel.bottomAnchor.constraint(equalTo: ActionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
    

}
