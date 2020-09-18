//
//  MovieCell.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    let movieView = MovieCellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMovieView()
    }
    
    func setup(_ data: Movie) {
        movieView.movieTitle.text = data.title
        
        let posterPath = data.poster_path ?? ""
        movieView.moviePoster.downloadImage(imageType: .poster, path: posterPath)
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
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

