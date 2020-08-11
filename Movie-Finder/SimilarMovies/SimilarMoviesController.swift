//
//  SimilarMoviesController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/10/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SimilarMoviesController: UIViewController {
    let similarMoviesView = MovieRecommendationView()
    let client = MovieClient()
    let dataSource = SimilarMoviesDataSource()
    var movieId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movieId)
        similarMoviesView.movieCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: "similarCell")
        similarMoviesView.movieCollectionView.dataSource = dataSource
        similarMoviesView.movieCollectionView.delegate = self
        client.recommendMovies(from: .similar(movieId: String(movieId))) { result in
        switch result {
            case .success(let results):
                self.dataSource.update(with: results.results)
                print(results.results.count)
                self.similarMoviesView.movieCollectionView.reloadData()
            case .failure(let error):
                error.localizedDescription
            }
        }
    }
    
    override func loadView() {
        view = similarMoviesView
    }
}

extension SimilarMoviesController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width/2.1), height: 300)
    }

}
