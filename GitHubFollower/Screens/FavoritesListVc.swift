//
//  FavoritesListVc.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 12/03/2022.
//

import UIKit

class FavoritesListVc: UIViewController {

    
    let tableView = UITableView()
    var favoritedFollowers:[Follower] = []
   
    weak var delegate:FollowerListVcDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
       
        
    }
    
    func configureViewController(){
        
        view.backgroundColor = .systemBackground
        title = "Favorites"
      //  navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GetFavoriteFollower()
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.identifier)
        
    }
    
    func GetFavoriteFollower(){
        
        PersistenceManager.RetriveFavorites {[weak self ] result in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let favorites):
                
                if favorites.isEmpty {
                    self.ShowEmptyState(message: "No favorites?\n Add one on the follower screen.", view: self.view)
                    
                }else{
                    self.favoritedFollowers = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
                
             
            case .failure(let error):
                self.presentGFalertOnMainThread(title: "Something went wrong.", message: error.rawValue, buttonTitle: "OK")
                
            }
        }
    }
    
}

extension FavoritesListVc:UITableViewDelegate , UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritedFollowers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FavoriteTableViewCell else{
            return UITableViewCell()
        }
        
        let favoritePerson = favoritedFollowers[indexPath.row]
        
        cell.Set(for: favoritePerson.login, imageUrl: favoritePerson.avatar_url)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let favoriteInIndex = favoritedFollowers[indexPath.row].login
        let followerVC = FollowerListVc()
        followerVC.username = favoriteInIndex
        followerVC.title = favoriteInIndex
        navigationController?.pushViewController(followerVC, animated: true)
                
    }
    

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else {return}
        
        let favoriteAtIndex = favoritedFollowers[indexPath.row]
        favoritedFollowers.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        PersistenceManager.UpateWith(favorite: favoriteAtIndex, actionType: .remove) { [weak self]error in
            guard let self = self else {return}
            
            guard let error = error else {
                return
        }
            self.presentGFalertOnMainThread(title: "Unable To remove", message: error.rawValue, buttonTitle: "OK")
        
        
    }
}
}
