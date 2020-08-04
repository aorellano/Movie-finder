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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let actorsTitle: UILabel = {
        let label = UILabel()
        label.text = "Actors"
        label.font = UIFont.genreFont
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let actorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 110, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        collectionView.register(ActorCell.self, forCellWithReuseIdentifier: "actorCell")
        collectionView.backgroundColor = UIColor.backgroundColor
        return collectionView
    }()
    
    let watchListButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to WatchList", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.75
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let seenItListButton: UIButton = {
        let button = UIButton()
        button.setTitle("Seen It", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.75
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        setupMovieBackdrop()
        setupMovieDescriptionView()
        setupButtons()
        setupActorsTitle()
        setupActorsCollectionView()
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
            movieDescriptionView.heightAnchor.constraint(equalToConstant: 300),
            movieDescriptionView.leadingAnchor.constraint(equalTo: movieBackdrop.leadingAnchor),
            movieDescriptionView.trailingAnchor.constraint(equalTo: movieBackdrop.trailingAnchor),
            movieDescriptionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  UIScreen.main.bounds.height/3.2)
        ])
    }
    
    func setupButtons() {
        addSubview(seenItListButton)
        addSubview(watchListButton)
        
        seenItListButton.layout(using: [
            seenItListButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            seenItListButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            seenItListButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2.5),
            seenItListButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        watchListButton.layout(using: [
            watchListButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            watchListButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            watchListButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2.5),
            watchListButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    func setupActorsTitle() {
        addSubview(actorsTitle)
        
        actorsTitle.layout(using: [
            actorsTitle.topAnchor.constraint(equalTo: movieDescriptionView.bottomAnchor, constant: 30),
            actorsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
    }
    
    func setupActorsCollectionView() {
        addSubview(actorsCollectionView)
        actorsCollectionView.layout(using: [
            actorsCollectionView.topAnchor.constraint(equalTo: actorsTitle.bottomAnchor, constant: 10),
            actorsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            actorsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            actorsCollectionView.bottomAnchor.constraint(equalTo: watchListButton.topAnchor, constant: -10)
        ])
        
    }
    
    func setup(_ movie: Movie) {
        let backdropPath = movie.backdrop_path ?? ""
        print(movie.title.count)
        if movie.title.count > 28 {
            movieDescriptionView.title.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        } else {
            movieDescriptionView.title.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        }
        movieDescriptionView.title.text = movie.title
        movieDescriptionView.plot.text = movie.overview
        var movieRating = "\((movie.vote_average ?? 0)/2.0)/5"
        movieDescriptionView.movieRating.text = movieRating
        movieBackdrop.downloadImage(imageType: .backdrop, path: backdropPath)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
