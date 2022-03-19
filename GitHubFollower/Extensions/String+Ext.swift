//
//  String+Ext.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 17/03/2022.
//

import Foundation


extension String {
    
    func convertStringToDate ()->Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    func DisplaylyDateInCorrectFormat()-> String {
        
        guard let date = self.convertStringToDate() else {return "N/A"}
       return date.ConvertToMonthYearFormat()
        
    }
    
    
    
}
