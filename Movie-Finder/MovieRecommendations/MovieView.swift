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
        return container
    }()
    
    let movieTitle: UILabel = {
        let label = UILabel()
        label.text = "Dummy Code"
        return label
    }
//
//    let moviePoster: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .red
//        return imageView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContainer()
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
