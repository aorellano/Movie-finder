//
//  HomeController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeController: UIViewController{
    let homeView = HomeView()
    let client = MovieClient()
    let dataSource = RecentMoviesDataSource()
    var first = [Movie]() {
        didSet {
            data.append(first)

        }
    }
    
    var data = [[Movie]]() {
        didSet {
            if data.count == 4 {
                dataSource.update(with: data)
                self.homeView.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.collectionView.dataSource = dataSource
        client.recommendMovies(from: .nowPlaying) { result in
            switch result {
            case .success(let results):
                self.first = results.results
            case .failure(let error):
                print(error)
            }
        }
        
        client.recommendMovies(from: .upcoming) { result in
            switch result {
            case .success(let results):
                self.first = results.results
            case .failure(let error):
                print(error)
            }
        }
        
        client.recommendMovies(from: .popular) { result in
            switch result {
            case .success(let results):
                self.first = results.results
            case .failure(let error):
                print(error)
            }
        }
        
        client.recommendMovies(from: .topRated) { result in
            switch result {
            case .success(let results):
                self.first = results.results
                self.homeView.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func loadView() {
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
    }
}
