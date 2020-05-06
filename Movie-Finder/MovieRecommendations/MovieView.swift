//
//  MovieView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/5/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieView: UIView {
    let movieContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .black
        container.layer.cornerRadius = 20
        container.layer.masksToBounds = true
        return container
    }()
    
    let moviePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let movieTitle: UILabel = {
        let label = UILabel()
        label.text = "Dummy Code"
        label.backgroundColor = .green
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContainer()
        setupMovieTitle()
        setupMoviePoster()
        
        
    }
    

    
    func setupContainer() {
        addSubview(movieContainer)
        
        movieContainer.layout(using: [
            movieContainer.topAnchor.constraint(equalTo: topAnchor),
            movieContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupMovieTitle() {
        movieContainer.addSubview(movieTitle)
        
        movieTitle.layout(using: [
            movieTitle.leadingAnchor.constraint(equalTo: movieContainer.leadingAnchor, constant:  5),
            movieTitle.trailingAnchor.constraint(equalTo: movieContainer.trailingAnchor, constant:  -5),
            movieTitle.bottomAnchor.constraint(equalTo: movieContainer.bottomAnchor),
            movieTitle.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupMoviePoster() {
        movieContainer.addSubview(moviePoster)
        
        moviePoster.layout(using: [
            moviePoster.topAnchor.constraint(equalTo: movieContainer.topAnchor),
            moviePoster.leadingAnchor.constraint(equalTo: movieContainer.leadingAnchor),
            moviePoster.trailingAnchor.constraint(equalTo: movieContainer.trailingAnchor),
            moviePoster.bottomAnchor.constraint(equalTo: movieTitle.topAnchor)
        ])
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
