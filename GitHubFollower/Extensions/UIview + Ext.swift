//
//  UIview + Ext.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 20/03/2022.
//

import UIKit

extension UIView {

    //variadic parameter
    func addSubviews(_ views:UIView...){
        
        for view in views {addSubview(view)}
    }
}
