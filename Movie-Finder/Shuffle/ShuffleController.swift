//
//  ShuffleController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/6/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
import CoreData

class ShuffleController: UIViewController {
    let shuffleView = ShuffleView()
    let client = MovieClient()
    var genre: String!
    var movie: Movie!
    var similarMovieId: Int?
    var savedMovie: SavedMovie!
    let movieFetch: NSFetchRequest<SavedMovie> = SavedMovie.fetchRequest()
    
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
        if let movieId = similarMovieId {
            UIView.animate(withDuration: 1, animations: {
            self.client.recommendMovies(from: .similar(movieId: String(movieId))) { result in
                switch result{
                case .success(let recommendations):
                    let randomMovie = Int.random(in: 1..<20)
                    let selectedMovie = recommendations.results[randomMovie]
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
        } else {
            UIView.animate(withDuration: 1, animations: {
                let page = Int.random(in: 1..<50)
                self.client.recommendMovies(from: .discover(page: String(page), genre: self.genre, sortedBy: "popularity.desc")) { result in
                    switch result{
                    case .success(let recommendations):
                        let randomMovie = Int.random(in: 1..<20)
                        let selectedMovie = recommendations.results[randomMovie]
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
    
    @objc func randomizeMovie() {
        if let movieId = similarMovieId {
        UIView.animate(withDuration: 1, animations: {
            self.shuffleView.movieView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                            self.client.recommendMovies(from: .similar(movieId: String(movieId))) { result in
                    switch result{
                    case .success(let recommendations):
                        let randomMovie = Int.random(in: 1..<20)
                        let selectedMovie = recommendations.results[randomMovie]
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
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.shuffleView.movieView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
            }) { (finished) in
                UIView.animate(withDuration: 1, animations: {
                    let page = Int.random(in: 1..<50)
                    self.client.recommendMovies(from: .discover(page: String(page), genre: self.genre, sortedBy: "popularity.desc")) { result in
                        switch result{
                        case .success(let recommendations):
                            let randomMovie = Int.random(in: 1..<20)
                            let selectedMovie = recommendations.results[randomMovie]
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
    }
    
    func setupMovieAction() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(presentMovieDetails))
        shuffleView.movieView.addGestureRecognizer(tapGestureRecognizer)
        shuffleView.movieView.moviePoster.isUserInteractionEnabled = true
    }
    
    @objc func presentMovieDetails() {
        let vc = MovieController()
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func seenItButtonPressed() {
        save(movie)
        savedMovie.seen = true
        MovieListManager.createSeenMovie(savedMovie)
        CoreDataStack.shared.saveContext()
        showAlert(with: "Added to Seen List!")
    }
    
    func showAlert(with message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
            let ac = UIAlertController(title: message, message: nil, preferredStyle: .alert)
            self.present(ac, animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                ac.dismiss(animated: true)
            }
        }
    }
    
    func save(_ movie: Movie) {
        savedMovie = SavedMovie(context: CoreDataStack.shared.managedContext)
        savedMovie.title = movie.title
        savedMovie.id = Int32(movie.id)
        savedMovie.backdrop_path = movie.backdrop_path
        savedMovie.poster_path = movie.poster_path
        savedMovie.overview = movie.overview
        savedMovie.release_date = movie.release_date
        savedMovie.vote_average = movie.vote_average!
    }
    
    @objc func watchItButtonPressed() {
        save(movie)
        savedMovie.seen = false
        CoreDataStack.shared.saveContext()
        showAlert(with: "Added to Watch List!")
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
