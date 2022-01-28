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
        
        let tabOne = HomeController()
        let tabOneItem = UITabBarItem(title: "Home", image: UIImage(named: "house"), tag: 0)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width/2.25), height: 300)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
        let tabTwo = SearchController(collectionViewLayout: layout)
        let tabTwoItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 1)
        
        let tabThree = MovieListController()
        let tabThreeItem = UITabBarItem(title: "My Movies", image: UIImage(named: "film"), tag: 2)
        
        let tabFour = MovieGenresController()
        let tabFourItem = UITabBarItem(title: "Recommend", image: UIImage(named: "text.justify"), tag: 3)
        
        tabOne.tabBarItem = tabOneItem
        tabTwo.tabBarItem = tabTwoItem
        tabThree.tabBarItem = tabThreeItem
        tabFour.tabBarItem = tabFourItem
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }

}
