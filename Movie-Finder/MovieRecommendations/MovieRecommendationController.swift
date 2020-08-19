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
    let movieController = MovieController()
    let dataSource = MoviesDataSource()
    var genre: String!
    let client = MovieClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupButtonTargets()
    }
    
    func setupCollectionView() {
        movieRecommendationView.movieCollectionView.dataSource = dataSource
        movieRecommendationView.movieCollectionView.delegate = self
        movieRecommendationView.shuffleButton.addTarget(self, action: #selector(shuffleButtonPressed), for: .touchUpInside)
    }
    
    func setupButtonTargets() {
         movieRecommendationView.movieCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: "yo")
    }
    
    func fetchRecommendations(with genreIds: [Int]) {
        let genreStr = genreIds.map({String($0)})
        let genre = genreStr.first ?? ""
        
        client.recommendMovies(from: .discover(page: "1", genre: genre, sortedBy: "popularity.desc")) { result in
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
    
    @objc func shuffleButtonPressed() {
        let vc = ShuffleController()
        print(genre)
        vc.genre = genre
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func loadView() {
        view = movieRecommendationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieRecommendationView.movieCollectionView.reloadData()
    }
}

extension MovieRecommendationController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width/2.1), height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = dataSource.data[indexPath.row]
        movieController.movie = movie
        navigationController?.pushViewController(movieController, animated: true)        
    }
}


