//
//  PersistenceManager.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 18/03/2022.
//

import Foundation


enum ActionType {
    
    case add,remove
}


enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum key {
        
        static let favorites = "favorites"
        
    }
    
    static func UpateWith(favorite: Follower ,actionType : ActionType , completion: @escaping (GFError?)->Void){
        
        RetriveFavorites { result in
            
            switch result{
                
            case .success(let favorites):
                 var retrivedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrivedFavorites.contains(favorite) else {
                        completion(.alreadyInFavorites)
                        return
                    }
                    retrivedFavorites.append(favorite)
                case .remove:
                    retrivedFavorites.removeAll {
                        $0.login == favorite.login
                    }
                }
                
                completion(save(favorites: retrivedFavorites))
                           
                
            case .failure(let error):
                completion(.unableToFavorite)
            }
            
        }
        
        
        
    }
    
    static func RetriveFavorites(completion : @escaping (Result <[Follower], GFError >) -> Void ){
        
        guard let favoritesFollowers = defaults.object(forKey: key.favorites) as? Data  else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesFollowers)
            completion(.success(favorites))
            
        }catch{
            completion(.failure(.unableToFavorite))
        }
    }
    
    
    static func save(favorites : [Follower]) -> GFError? {
        
        do{
            let encoder = JSONEncoder()
            let encodedFavorite = try encoder.encode(favorites)
            defaults.set(encodedFavorite, forKey: key.favorites)
            return nil
            
        }catch {
            return .unableToFavorite
        }
    }
}
