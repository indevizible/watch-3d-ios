//
//  TabBarController.swift
//  Watch 3D
//
//  Created by VIRAKRI JINANGKUL on 1/14/17.
//  Copyright © 2017 VIRAKRI JINANGKUL. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = Constants.designs.colors.white
        UITabBar.appearance().barTintColor = Constants.designs.colors.black
        let attributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 13, weight: -0.2)]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        
        for item in tabBar.items! {
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        }
    }
    
}


