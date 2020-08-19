//
//  ShuffleController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/6/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class ShuffleController: UIViewController {
    let shuffleView = ShuffleView()
    let client = MovieClient()
    var genre: String!
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonTargets()
        shuffleMovies()
        setupMovieAction()
    }
    
    func setupButtonTargets() {
        shuffleView.buttonsContainerView.shuffleButton.addTarget(self, action: #selector(randomizeMovie), for: .touchUpInside)
        shuffleView.buttonsContainerView.seenItListButton.addTarget(self, action: #selector(seenItButtonPressed), for: .touchUpInside)
        shuffleView.buttonsContainerView.watchListButton.addTarget(self, action: #selector(watchItButtonPressed), for: .touchUpInside)
    }
    
    func shuffleMovies() {
        UIView.animate(withDuration: 1, animations: {
            let page = Int.random(in: 1..<50)
            self.client.recommendMovies(from: .discover(page: String(page), genre: self.genre, sortedBy: "popularity.desc")) { result in
                switch result{
                case .success(let recommendations):
                    let randomMovie = Int.random(in: 1..<15)
                    print(recommendations.results[randomMovie])
                    let movieTitle = recommendations.results.first!
                    self.shuffleView.movieView.movieTitle.text = recommendations.results.first?.title
                    let image = recommendations.results.first?.poster_path ?? ""
                    self.shuffleView.movieView.moviePoster.downloadImage(imageType: .poster, path: image)
                    self.movie = recommendations.results.first!
                case .failure(let error):
                    
                    print(error)
                }
            }
            self.shuffleView.movieView.transform = CGAffineTransform.identity
        })
    }
    
    @objc func randomizeMovie() {
        UIView.animate(withDuration: 1, animations: {
            self.shuffleView.movieView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                let page = Int.random(in: 1..<50)
                self.client.recommendMovies(from: .discover(page: String(page), genre: self.genre, sortedBy: "popularity.desc")) { result in
                    switch result{
                    case .success(let recommendations):
                        let randomMovie = Int.random(in: 1..<20)
                        var selectedMovie = recommendations.results[randomMovie]
                        while MyMovieList.seenMovies.contains(selectedMovie) || MyMovieList.watchMovies.contains(selectedMovie) {
                            let randomMovie = Int.random(in: 1..<20)
                            selectedMovie = recommendations.results[randomMovie]
                        }
                        
                        self.shuffleView.movieView.movieTitle.text = selectedMovie.title
                        let image = selectedMovie.poster_path ?? ""
                        self.shuffleView.movieView.moviePoster.downloadImage(imageType: .poster, path: image)
                        self.movie = selectedMovie
                    case .failure(let error):
                        print(error)
                    }
                }
                self.shuffleView.movieView.transform = CGAffineTransform.identity
            })
        }
    }
    
    func setupMovieAction() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(presentMovieDetails))
        shuffleView.movieView.addGestureRecognizer(tapGestureRecognizera)
        shuffleView.movieView.moviePoster.isUserInteractionEnabled = true
    }
    
    @objc func presentMovieDetails() {
        print("this is working")
        let vc = MovieController()
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func seenItButtonPressed() {
        MyMovieList.seenMovies.append(movie)
        
    }
    
    @objc func watchItButtonPressed() {
        MyMovieList.watchMovies.append(movie)
    }
    
    override func loadView() {
        view = shuffleView
    }
}

extension ShuffleController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieController()
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }
}
