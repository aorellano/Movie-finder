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
    override func viewDidLoad() {
        print("Thats whats up")
    }
    
    override func loadView() {
        view = movieRecommendationView
    }
}
