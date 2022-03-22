//
//  UIHelper.swift
//  GitHubFollower
//
//  Created by Oday Dieg on 14/03/2022.
//

import UIKit


//السبب اني مش عامله استركت علشان مقدرش آكريت منه اوبجكت فاضي من غير ماستخدمه لكن كده طلاما هعمله آكسس يبقي هتسخدمه

enum UiHelper {
    
    static func createThreeColumnFlowLayout(for view:UIView)-> UICollectionViewFlowLayout{
        
        let width                                       = view.bounds.width
        let padding:CGFloat                             = 12
        let minumumItemSpacing:CGFloat                  = 10
        let availableWidth                              = width - (padding * 2) - (minumumItemSpacing * 2)
        let itemWidth                                   = availableWidth / 3
        
        let flowLayout                                  = UICollectionViewFlowLayout()
        
        flowLayout.sectionInset                         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                             = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
}
