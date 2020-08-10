//
//  RecentMoviesView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/24/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieListView: UIView {
    let recentMoviesStackView = RecentMoviesStackView()
    
    let movieListCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.backgroundColor
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor
        
        movieListCollectionView.register(MovieCell
.self, forCellWithReuseIdentifier: "movieListCell")
        
        setupRecentMoviesStackView()
        setupCollectionView()
    }
    
    func setupRecentMoviesStackView() {
        addSubview(recentMoviesStackView)
    
        recentMoviesStackView.layout(using: [
            recentMoviesStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            recentMoviesStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            recentMoviesStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            recentMoviesStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupCollectionView() {
        addSubview(movieListCollectionView)
        
        movieListCollectionView.layout(using: [
            movieListCollectionView.topAnchor.constraint(equalTo: recentMoviesStackView.bottomAnchor, constant: 40),
            movieListCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            movieListCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            movieListCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
