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
    let client = MovieClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieRecommendationView.movieCollectionView.dataSource = dataSource
        movieRecommendationView.movieCollectionView.delegate = self
        
        fetchRecommendations()
    }
    
    func fetchRecommendations() {
        client.recommendMovies(from: .discover(page: "1", genre: "28", subgenres: "219404", sortedBy: "popularity.desc")) { result in
            switch result{
            case .success(let recommendations):
                self.dataSource.update(with: recommendations.results)
                self.movieRecommendationView.movieCollectionView.reloadData()
                print(recommendations.results)
                
            case .failure(let error):
                print(error)
            }
        }
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

