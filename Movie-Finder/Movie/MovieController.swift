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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieView.setup(movie)
    }

    override func loadView() {
        view = movieView
        
    }

}
