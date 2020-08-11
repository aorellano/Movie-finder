//
//  MovieController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/14/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class MovieController: UIViewController {
    let movieView = MovieView()
    var movie: Movie!
    var client = MovieClient()
    var dataSource = ActorsDataSource()
    var listDataSource = MovieListDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieView.actorsCollectionView.dataSource = dataSource
        movieView.setup(movie)
        print(movie.title)
        

         movieView.playButton.addTarget(self, action: #selector(playTrailer), for: .touchUpInside)
        movieView.seenItListButton.addTarget(self, action: #selector(seenItButtonPressed), for: .touchUpInside)
        
        movieView.watchListButton.addTarget(self, action: #selector(watchItButtonPressed), for: .touchUpInside)
        
       
        
        movieView.playerView.delegate = self
        movieView.movieDescriptionView.similarMoviesButton.addTarget(self, action: #selector(findSimilarMovies), for: .touchUpInside)
       // movieView.playerView.load(withVideoId: <#T##String#>)
       // movieView.playerView.webView(<#T##webView: WKWebView##WKWebView#>, didFinish: <#T##WKNavigation!#>)

    }
    
    @objc func playTrailer() {
        print("hi")
        client.getVideo(from: .video(movieId: String(movie.id))) { result in
            switch result {
            case .success(let results):
                print(results.results ?? "")
                let videoKey = results.results.first?.key ?? ""
                self.movieView.playerView.isHidden = false
                self.movieView.playerView.load(withVideoId: videoKey)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
    @objc func seenItButtonPressed() {
        Data.seenMovies.append(movie)
    }
    
    @objc func watchItButtonPressed() {
        Data.watchMovies.append(movie)
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
        if state == .paused || state == .ended {
            movieView.playerView.isHidden = true
        }
    }
    
}
