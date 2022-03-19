//
//  ErrorMessage.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 14/03/2022.
//

import Foundation


enum GFError: String , Error {
    
    case invalidUserName    = "This user name created as invalid request . Plesae try again."
    case unableToComplete   = "Unable to complete your Request , Please check your internet connection"
    case invalidResponse    = "Invalid response from the server , Please try again"
    case invalidData        = "The data received from the server was invalid , Please try again"
    case unableToFavorite   = "There was an error favoriting this user . Please Try again. "
    case alreadyInFavorites = "You've already favorited this user. You must REALLY Like them!"
    
}
