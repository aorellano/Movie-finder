//
//  MyMovieCell.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/10/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
import Cosmos
import TinyConstraints

class MovieListCell: UICollectionViewCell {
    let movieCell = MovieCell()
    var movie: SavedMovie!
    var cosmosView: CosmosView = {
        let view = CosmosView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupCosmos()
    }
    
    func setupCosmos() {
        cosmosView.didTouchCosmos = { rating in
            self.movie.rating = Int16(rating)
            CoreDataStack.shared.saveContext()
        }
    }
    
    func setup(_ data: SavedMovie, _ watchList: Bool) {
        movie = data
        movieCell.movieView.movieTitle.text = data.title
        let posterPath = data.poster_path ?? ""
        movieCell.movieView.moviePoster.downloadImage(imageType: .poster, path: posterPath)
        if watchList == true {
            cosmosView.isHidden = false
            cosmosView.rating = Double(movie.rating)
        } else {
            cosmosView.isHidden = true
        }
    }
    
    func setupCell() {
        addSubview(movieCell)
        addSubview(cosmosView)
        
        movieCell.translatesAutoresizingMaskIntoConstraints = false
        movieCell.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        movieCell.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        movieCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieCell.heightAnchor.constraint(equalToConstant: 275).isActive = true
        
        cosmosView.topAnchor.constraint(equalTo: movieCell.bottomAnchor).isActive = true
        cosmosView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cosmosView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cosmosView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
