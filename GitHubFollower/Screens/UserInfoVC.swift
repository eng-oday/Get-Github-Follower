//
//  UserInfoVC.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 16/03/2022.
//

import UIKit
import SafariServices


protocol UserInfoVCDelegate: AnyObject {
    
    func didTapGithubProfileItem(user:User)
    func didTapGetFollowerItem(user:User)
    
}

class UserInfoVC: UIViewController {

    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let date = GFBodyLabel(textAlignment: .center)
    var itemViews:[UIView] = []
    var username:String!
    weak var delegate:FollowerListVcDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureNavigationController()
        GetUserData()
        LayoutContainerUI()
    }
    
    func configureNavigationController(){
        
        let doneButton                              = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(DismissVC))
        navigationItem.rightBarButtonItem           = doneButton
        self.navigationItem.scrollEdgeAppearance    = UINavigationBarAppearance()

    }
    
        @objc func DismissVC()
    {
        dismiss(animated: true, completion: nil)
        
    }
    
    func GetUserData(){
                
        NetworkManager.shared.GetUser(for: username) { [weak self]result in
            
            guard let self = self else {return}
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
         
                    self.configureUIElements(with: user)
                }

               
            case .failure(let error):
                self.presentGFalertOnMainThread(title: "Something Went Wrong", message: error.rawValue, buttonTitle: "OK")
               
            }
        }
                
    }
    
    func configureUIElements(with user:User ){
        
        let repoItemVC = GFReposItemVC(user: user)
        repoItemVC.delegate = self
        
        let followerItemVC = GFFollowerItemVC(user: user)
        followerItemVC.delegate = self
        
        self.AddVCToContainer(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.AddVCToContainer(childVC: repoItemVC, to: self.itemViewOne)
        self.AddVCToContainer(childVC: followerItemVC, to: self.itemViewTwo)
        self.date.text = "GithHub since \(user.created_at.DisplaylyDateInCorrectFormat())"
    }
    
    
    private func LayoutContainerUI(){
        
        let padding:CGFloat = 20
        let itemHeight:CGFloat = 160
        
        itemViews = [headerView, itemViewOne , itemViewTwo , date]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints  = false
            
            NSLayoutConstraint.activate([
            
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            
            ])
        }

        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            date.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            date.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // func to add VC to UIview
    func AddVCToContainer(childVC : UIViewController , to containerView : UIView){
        
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
        
    }
    
}


extension UserInfoVC: UserInfoVCDelegate {
    
    func didTapGithubProfileItem(user: User) {
        guard let url = URL(string: user.html_url) else {
            presentGFalertOnMainThread(title: "Invalid URL", message: "The url Attached to this user is invalid.", buttonTitle: "ok")
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        
        present(safariVC, animated: true)
    
    }
    
    func didTapGetFollowerItem(user: User) {

        guard user.followers != 0 else{
            presentGFalertOnMainThread(title: "No Follower", message: "This user has no follower , What a Shame 😢 .", buttonTitle: "So Sad ")
            return
        }
        delegate.didRequestFollower(with: user.login)
        DismissVC()
        
    }
    
    
    
    
    
}
