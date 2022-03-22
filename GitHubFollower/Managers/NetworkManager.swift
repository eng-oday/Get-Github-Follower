//
//  NetworkManager.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 14/03/2022.
//

import UIKit


class NetworkManager {
    
    
    static let shared           = NetworkManager()
    private let baseURL         = "https://api.github.com"
    var cashe                   = NSCache<NSString,UIImage>()
    
    private init(){}
    
 
    
    func GetFollowers(for userName:String , page:Int , completion: @escaping (Result<[Follower],GFError>) -> Void) {
        
        let endpoint = baseURL + "/users/\(userName)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUserName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else{
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let followerData = try decoder.decode([Follower].self, from: data)
                
                completion(.success(followerData))
            }catch{
                completion(.failure(.invalidData))

            }
        }
        
        task.resume()
        
        
    }
    
    
    func GetUser(for userName:String ,completion: @escaping (Result<User,GFError>) -> Void) {
        
        let endpoint = baseURL + "/users/\(userName)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUserName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else{
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                // to get date as date from server not string 
                decoder.dateDecodingStrategy = .iso8601
                
                let user = try decoder.decode(User.self, from: data)
                
                completion(.success(user))
            }catch{
                completion(.failure(.invalidData))

            }
            
        }
        
        task.resume()
        
        
    }
    
    
    func downloadImageView(from StringURL: String , completion: @escaping (UIImage?)->Void){
        
        // to check if image cahsed before dont download it aggain
        let cahseKey = NSString(string: StringURL)
        
        if let image = cashe.object(forKey: cahseKey) {
            completion(image)
            return
        }
        guard let url = URL(string: StringURL) else {
            completion(nil)
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            
            guard let self = self , let data = data , error == nil , let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                return completion(nil)
            }
            
            guard let image = UIImage(data: data) else {
                return completion(nil)
            }
            // if u download image cashe it
            self.cashe.setObject(image, forKey: cahseKey)
            completion(image)

                
        }
        task.resume()
        
        
    }
    
    
    
}
