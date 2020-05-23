//
//  MovieCell.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/5/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    let movieView = MovieCellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMovieView()
    }
    
    func setupMovieView() {
        addSubview(movieView)
        
        movieView.layout(using: [
            movieView.topAnchor.constraint(equalTo: topAnchor),
            movieView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setup(_ movie: Movie) {
        let posterPath = movie.poster_path ?? ""
        movieView.movieTitle.text = movie.title
        movieView.moviePoster.downloadImage(imageType: .poster, path: posterPath)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
