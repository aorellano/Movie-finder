//
//  MovieRecommendations.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//
import UIKit

class MovieRecommendationController: UIViewController {
    let movieRecommendationView = MovieRecommendationView()
    let dataSource = MoviesDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Thats whats up")
        movieRecommendationView.movieCollectionView.dataSource = dataSource
    }
    
    override func loadView() {
        view = movieRecommendationView
    }
}
