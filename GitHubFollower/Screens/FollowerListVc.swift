//
//  FollowerListVc.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 13/03/2022.
//

import UIKit


protocol FollowerListVcDelegate: AnyObject{
    
    
    func didRequestFollower(with userName:String)
}


class FollowerListVc: UIViewController {
    
    
    
    //step 1
    enum Section{case Main}
    
    //step 2
    var dataSource:UICollectionViewDiffableDataSource<Section,Follower>!
    
    var username:String!
    var collectionView:UICollectionView!
    let searchController = UISearchController()
    var followers:[Follower] = []
    var filtteredFollower:[Follower] = []
    var page: Int = 1
    var IsHaveMoreFollower = true
    var isSearching = false
    let favoriteVc = FavoritesListVc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        ConfigureSearchBar()
        GetFollower(for: username, page: page)
        
        //step6
        configureDataSource()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoriteVc.delegate = self
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTaped))
        navigationItem.rightBarButtonItem = addButton
        
        
        
    }
    
    func GetFollower(for username:String , page: Int)
    {
        ShowLoadingView()
        NetworkManager.shared.GetFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else {return}
            self.DismissLoadingView()
            DispatchQueue.main.async {
                switch result
                {
                case .success(let followers):
                    if followers.count < 100 { self.IsHaveMoreFollower = false}
                    self.followers.append(contentsOf: followers)
                    
                    if followers.isEmpty {
                        let message = "This user doesn't have any followers, Go follow them 🥺"
                        self.ShowEmptyState(message:message , view: self.view)
                    }
                    
                    //step5
                    self.updateData(on: self.followers)
                case .failure(let errorMessage):
                    self.presentGFalertOnMainThread(title: "OOPS..", message: errorMessage.rawValue, buttonTitle: "OK")
                }
            }
            
        }
        
    }
    
    
    private func configureViewController(){ view.backgroundColor = .systemBackground }
    
    private func configureCollectionView(){
        
        collectionView = UICollectionView(
            frame:view.bounds,
            collectionViewLayout: UiHelper.createThreeColumnFlowLayout(for: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identifier)
        
    }
    //step 3
    private func configureDataSource(){
        
        dataSource = UICollectionViewDiffableDataSource<Section,Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower)->UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identifier, for: indexPath) as? FollowerCell else {
                return UICollectionViewCell()
            }
            cell.SetFollower(follower: follower)
            return cell
        })
    }
    
    //step4
    private  func updateData(on followers: [Follower] ){
        
        var snapShot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapShot.appendSections([.Main])
        snapShot.appendItems(followers)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true)
            
        }
    }
    
    @objc func addButtonTaped(){
        
        ShowLoadingView()
        NetworkManager.shared.GetUser(for: username) {[weak self] result in
            
            guard let self = self else {return}
            self.DismissLoadingView()
            switch result{
                
            case .success(let user):
                
                let favorite = Follower(login: user.login, avatar_url: user.avatar_url)
                
                PersistenceManager.UpateWith(favorite: favorite, actionType: .add) { error in
                    
                    guard let error = error else {
                        self.presentGFalertOnMainThread(title: "Success!", message: "You have successfully favorited this user 🎉", buttonTitle: "GREAT")
                        return
                    }
                    self.presentGFalertOnMainThread(title: "Somthing Went Wrong !", message: error.rawValue, buttonTitle: "OK")
                }
            case .failure(let error):
                self.presentGFalertOnMainThread(title: "Something Went Wrong ! ", message: error.rawValue, buttonTitle: "OK")
                
            }
        }
    }
    
    
    
    func ConfigureSearchBar(){
        
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        searchController.searchBar.placeholder = "Search For Users."
        
        navigationItem.searchController = searchController
        
        
    }
    
}

extension FollowerListVc : UICollectionViewDelegate {
    
    // for pagination
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        // it become true when scroll arrive to end of collection
        if offsetY > contentHeight - height {
            guard IsHaveMoreFollower else {
                return
            }
            page += 1
            // call api with page number 2
            GetFollower(for: username, page: page)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let activeArray = isSearching ? filtteredFollower : followers
        let follower = activeArray[indexPath.item]
        
        
        let UserInfoVC = UserInfoVC()
        
        UserInfoVC.delegate = self
        
        let navigationController = UINavigationController(rootViewController: UserInfoVC)
        UserInfoVC.username = follower.login
        present(navigationController, animated: true)
        
    }
    
    
}

extension FollowerListVc : UISearchResultsUpdating,UISearchBarDelegate {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let filter = searchController.searchBar.text , !filter.isEmpty else {return}
        
        isSearching = true
        filtteredFollower = followers.filter({
            
            $0.login.lowercased().contains(filter.lowercased())
            
        })
        
        updateData(on: filtteredFollower)
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: followers)
    }
    
    
}

extension FollowerListVc:FollowerListVcDelegate {
    
    
    func didRequestFollower(with userName: String) {
        
        self.username = userName
        title = userName
        page = 1
        followers.removeAll()
        filtteredFollower.removeAll()
        searchController.searchBar.text = nil
        DispatchQueue.main.async {
            self.collectionView.setContentOffset(.zero, animated: false)
        }
        GetFollower(for: userName, page: page)
        
            }
    
}
