//
//  Date+Ext.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 17/03/2022.
//

import Foundation

extension Date {
    
    
    func ConvertToMonthYearFormat()->String{
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MMM yyyy"
        return dateFormater.string(from: self)
    }
    
}
