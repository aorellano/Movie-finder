//
//  RecentMoviesController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/24/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class RecentMoviesController: UIViewController {
    let recentMoviesView = RecentMoviesView()
    let dataSource = MoviesDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tab 1"
        recentMoviesView.recentMoviesCollectionView.dataSource = dataSource
        
        //fetchRecentMovies
    }
    
    @objc func handleSegmentedControl(){
        print("This is being changed")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        view = recentMoviesView
    }
}


