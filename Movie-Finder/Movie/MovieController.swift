//
//  MovieController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/14/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieController: UIViewController {
    let movieView = MovieView()
    var movie: Movie!
    var client = MovieClient()
    var dataSource = ActorsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieView.actorsCollectionView.dataSource = dataSource
        movieView.setup(movie)
        print(movie.title)
        
        client.getCast(from: .cast(movieId: String(movie.id))) { result in
            switch result {
            case .success(let results):
                self.dataSource.update(with: results.cast)
                self.movieView.actorsCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    override func loadView() {
        view = movieView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieView.setup(movie)
    }

}
