//
//  SceneDelegate.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 12/03/2022.
//

import UIKit



//public func setNavigationBarCorrectly(navigationContrroler : UINavigationController ){
//
//    let navBarApperance = UINavigationBarAppearance()
//
//    navBarApperance.configureWithOpaqueBackground()
//    navBarApperance.backgroundColor = UIColor.systemBackground
//    //navigationContrroler.navigationBar.scrollEdgeAppearance = navBarApperance
//    navigationContrroler.navigationBar.standardAppearance = navBarApperance
//    navigationContrroler.navigationBar.tintColor = .systemGreen
//
//}

public func setNavigationBarCorrectly(){
    
    let navBarApperance = UINavigationBarAppearance()
    
    navBarApperance.configureWithOpaqueBackground()
    navBarApperance.backgroundColor = UIColor.systemBackground
    //navigationContrroler.navigationBar.scrollEdgeAppearance = navBarApperance
    UINavigationBar.appearance().standardAppearance = navBarApperance
    UINavigationBar.appearance().tintColor = .systemGreen
   
}


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            
        guard let WindowScene = (scene as? UIWindowScene) else { return }
        
        //to create initial window and set frame size
        window = UIWindow(frame: WindowScene.coordinateSpace.bounds)
        window?.windowScene = WindowScene
        window?.rootViewController = CreateTabBar()
        window?.makeKeyAndVisible()
        setNavigationBarCorrectly()

        
        
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
    
  // to set navigation bar correctly with safe area
    
            //let navBarAppearance = UINavigationBarAppearance()
            //favoritesNavigation.navigationBar.scrollEdgeAppearance = navBarAppearance
            //navBarAppearance.configureWithOpaqueBackground()
            // navBarAppearance.backgroundColor = UIColor.systemGray4
    
    

    
    func CreateTabBar()-> UITabBarController{

        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        tabbar.tabBar.backgroundColor = .systemBackground
        
        tabbar.viewControllers = [CreateSearchNC(),CreateFavoriteListNC()]

        return tabbar


    }
    
    
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

