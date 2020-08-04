//
//  MovieDescriptionView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/22/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieDescriptionView: UIView {
    var descriptionContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .red
        container.layer.cornerRadius = 30
        return container
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.secondaryTitleFont
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let ratingBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.highlightColor
        view.layer.cornerRadius = 25
        return view
    }()
    
    let movieRating: UILabel = {
        let label = UILabel()
        label.text = "4/5"
        label.font = UIFont.collectionViewFont
        return label
    }()
    
    let movieYear: UILabel = {
        let label = UILabel()
        label.text = "2020"
        label.textColor = .white
        label.font = UIFont.collectionViewFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionTitle: UILabel = {
        let label = UILabel()
        label.text = "Movie Plot"
        label.font = UIFont.genreFont
        label.textColor = .white
        return label
    }()
    
    let plot: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.descriptionFont
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        layer.cornerRadius = 30
        
        addMovieTitle()
        addMovieRating()
        addMovieYear()
        addDescriptionTitle()
        addMovieDescription()
        
    }

    func addMovieTitle() {
        addSubview(title)
           
        title.layout(using: [
            title.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80)
        ])
    }
    
    
       
    func addMovieRating() {
        addSubview(ratingBackground)
        ratingBackground.addSubview(movieRating)
        
        ratingBackground.layout(using: [
            ratingBackground.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            ratingBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -30),
            ratingBackground.heightAnchor.constraint(equalToConstant: 50),
            ratingBackground.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        movieRating.layout(using: [
            movieRating.centerXAnchor.constraint(equalTo: ratingBackground.centerXAnchor),
            movieRating.centerYAnchor.constraint(equalTo: ratingBackground.centerYAnchor)
        ])
    }
    
    func addMovieYear() {
        addSubview(movieYear)
        
        movieYear.layout(using: [
            movieYear.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            movieYear.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10)
        ])
    }
    
    func addDescriptionTitle() {
        addSubview(descriptionTitle)
        
        descriptionTitle.layout(using: [
            descriptionTitle.topAnchor.constraint(equalTo: movieYear.bottomAnchor, constant: 25),
            descriptionTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor)
        ])
        
    }
    
    func addMovieDescription() {
        addSubview(plot)
        
        plot.layout(using: [
            plot.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 15),
            plot.leadingAnchor.constraint(equalTo: descriptionTitle.leadingAnchor),
            plot.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
        
    }
    

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
