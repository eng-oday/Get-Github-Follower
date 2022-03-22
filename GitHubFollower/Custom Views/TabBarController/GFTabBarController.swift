//
//  GFTabBarController.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 19/03/2022.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemGreen
        tabBar.backgroundColor = .systemBackground
        viewControllers = [CreateSearchNC(),CreateFavoriteListNC()]

        
    }
    
    func CreateSearchNC()->UINavigationController{

        let searchVc = SearchVc()
        searchVc.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        
        let searchNavigation = UINavigationController(rootViewController: searchVc)
        searchNavigation.navigationItem.titleView?.tintColor = .systemBackground
        
        return searchNavigation

    }

    func CreateFavoriteListNC()->UINavigationController{

        let favoriteList = FavoritesListVc()
        favoriteList.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        
        let favoritesNavigation = UINavigationController(rootViewController: favoriteList)
        favoritesNavigation.navigationItem.titleView?.tintColor = .systemBackground
        favoritesNavigation.navigationItem.largeTitleDisplayMode = .always
        favoritesNavigation.navigationBar.prefersLargeTitles = true

        return favoritesNavigation

    }

}
