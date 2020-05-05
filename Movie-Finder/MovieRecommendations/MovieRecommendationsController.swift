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
        
        movieRecommendationView.movieCollectionView.dataSource = dataSource
        movieRecommendationView.movieCollectionView.delegate = self
    }
    
    override func loadView() {
        view = movieRecommendationView
    }
}

extension MovieRecommendationController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width/2.1), height: 300)
    }
}

