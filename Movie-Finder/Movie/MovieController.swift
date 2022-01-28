//
//  MovieController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/14/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView
import CoreData

class MovieController: UIViewController {
    let movieView = MovieView()
    var movie: Movie!
    var savedMovie: SavedMovie!
    var client = MovieClient()
    var dataSource = ActorsDataSource()
    var listDataSource = MovieListDataSource()
    let movieFetch: NSFetchRequest<SavedMovie> = SavedMovie.fetchRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieView.actorsCollectionView.dataSource = dataSource
        movieView.playerView.delegate = self
        movieView.setup(movie)
        setupActions()
    }
    
    func setupActions() {
        movieView.playButton.addTarget(self, action: #selector(playTrailer), for: .touchUpInside)
        movieView.seenItListButton.addTarget(self, action: #selector(seenItButtonPressed), for: .touchUpInside)
        movieView.watchListButton.addTarget(self, action: #selector(watchItButtonPressed), for: .touchUpInside)
        movieView.movieDescriptionView.similarMoviesButton.addTarget(self, action: #selector(findSimilarMovies), for: .touchUpInside)
    }
    
    @objc func playTrailer() {
        client.getVideo(from: .video(movieId: String(movie.id))) { result in
            switch result {
            case .success(let results):
                let videoKey = results.results.first?.key ?? ""
                self.movieView.playerView.isHidden = false
                self.movieView.playerView.load(withVideoId: videoKey)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func seenItButtonPressed() {
        save(movie)
        savedMovie.seen = true
        MovieListManager.createSeenMovie(savedMovie)
        CoreDataStack.shared.saveContext()
        
        showAlert(with: "Added to Seen List!")
    }
    
    @objc func watchItButtonPressed() {
        save(movie)
        savedMovie.seen = false
        CoreDataStack.shared.saveContext()
        showAlert(with: "Added to Watch List!")
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
        savedMovie.rating = 0
    }

    override func loadView() {
        view = movieView
    }
    
    @objc func findSimilarMovies() {
        let vc = SimilarMoviesController()
        vc.movieId = movie.id
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieView.setup(movie)
        movieView.playerView.isHidden = true
        client.getCast(from: .cast(movieId: String(movie.id))) { result in
            switch result {
            case .success(let results):
                self.dataSource.update(with: results.cast)
                print(self.movie.id)
                self.movieView.actorsCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        movieView.actorsCollectionView.reloadData()
    }
}

extension MovieController: WKYTPlayerViewDelegate {
    func playerView(_ playerView: WKYTPlayerView, didChangeTo state: WKYTPlayerState) {
        if state == .ended {
            movieView.playerView.isHidden = true
        }
    }
}
