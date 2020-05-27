//
//  TabController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/24/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class TabController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.tabBar.barTintColor = UIColor.backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabOne = RecentMoviesController()
        let tabOneItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "film"), tag: 0)
        let tabTwo = MovieGenresController()
        let tabTwoItem = UITabBarItem(title: "Tab 2", image: UIImage(named: "text.justify"), tag: 1)
        
        tabOne.tabBarItem = tabOneItem
        tabTwo.tabBarItem = tabTwoItem
        self.viewControllers = [tabOne, tabTwo]
    }

}
