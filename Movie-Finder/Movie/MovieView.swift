//
//  MovieView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/14/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieView: UIView {
    var movieBackdrop: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let movieDescriptionView: MovieDescriptionView = {
        let view = MovieDescriptionView()
        view.backgroundColor = UIColor.backgroundColor
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        setupMovieBackdrop()
        setupMovieDescriptionView()
    }
    
    func setupMovieBackdrop() {
        addSubview(movieBackdrop)
        
        movieBackdrop.layout(using: [
            movieBackdrop.topAnchor.constraint(equalTo: topAnchor),
            movieBackdrop.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            movieBackdrop.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            movieBackdrop.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:  -UIScreen.main.bounds.height/2)
        ])
    }
    
    func setupMovieDescriptionView() {
        addSubview(movieDescriptionView)

        movieDescriptionView.layout(using: [
            movieDescriptionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            movieDescriptionView.leadingAnchor.constraint(equalTo: movieBackdrop.leadingAnchor),
            movieDescriptionView.trailingAnchor.constraint(equalTo: movieBackdrop.trailingAnchor),
            movieDescriptionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  UIScreen.main.bounds.height/3.2)
        ])
    }
    
    func setup(_ movie: Movie) {
        let backdropPath = movie.backdrop_path ?? ""
        movieDescriptionView.title.text = movie.title
        movieDescriptionView.plot.text = movie.overview
        var movieRating = "\(Int(round((movie.vote_average ?? 0)/2)))/5"
        movieDescriptionView.movieRating.text = movieRating
        movieBackdrop.downloadImage(imageType: .backdrop, path: backdropPath)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
