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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shuffleView.buttonsContainerView.shuffleButton.addTarget(self, action: #selector(randomizeMovie), for: .touchUpInside)
        
        UIView.animate(withDuration: 1, animations: {
            let page = Int.random(in: 1..<80)
            self.client.recommendMovies(from: .discover(page: String(page), genre: self.genre, sortedBy: "popularity.desc")) { result in
                switch result{
                case .success(let recommendations):
                    let randomMovie = Int.random(in: 1..<20)
                    print(recommendations.results[randomMovie])
                    let movieTitle = recommendations.results.first!
                    self.shuffleView.movieView.movieTitle.text = recommendations.results.first?.title
                    let image = recommendations.results.first?.poster_path ?? ""
                    self.shuffleView.movieView.moviePoster.downloadImage(imageType: .poster, path: image)
                case .failure(let error):
                    
                    print(error)
                }
            }
            self.shuffleView.movieView.transform = CGAffineTransform.identity
        })
    }
    
    @objc func randomizeMovie() {
        print("button pressed")
        UIView.animate(withDuration: 1, animations: {
            self.shuffleView.movieView.transform = CGAffineTransform(scaleX: 0.10, y: 0.10)

        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                let page = Int.random(in: 1..<100)
                self.client.recommendMovies(from: .discover(page: String(page), genre: self.genre, sortedBy: "popularity.desc")) { result in
                    switch result{
                    case .success(let recommendations):
                        let randomMovie = Int.random(in: 1..<20)
                        print(recommendations.results[randomMovie])
                        let movieTitle = recommendations.results.first!
                        self.shuffleView.movieView.movieTitle.text = recommendations.results.first?.title
                        let image = recommendations.results.first?.poster_path ?? ""
                        self.shuffleView.movieView.moviePoster.downloadImage(imageType: .poster, path: image)
                    case .failure(let error):
                        
                        print(error)
                    }
                }
                self.shuffleView.movieView.transform = CGAffineTransform.identity
            })
            
        }
    }
    
    override func loadView() {
        view = shuffleView
    }
}
