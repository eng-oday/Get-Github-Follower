//
//  User.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 13/03/2022.
//

import Foundation

struct User:Codable {
    let login:String
    let avatar_url:String
    let html_url:String
    var name:String?
    var location:String?
    var bio:String?
    let public_repos:Int
    let public_gists:Int
    let followers:Int
    let following:Int
    let created_at:Date
    
    
}
