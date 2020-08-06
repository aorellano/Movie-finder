//
//  MovieRecommendationView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieRecommendationView: UIView {
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Recommended\nMovies"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.secondaryTitleFont
        label.textColor = UIColor.highlightColor
        return label
    }()

    let movieCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.backgroundColor = UIColor.backgroundColor
        return collectionView
    }()
    
    let shuffleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let image = UIImage(named: "shuffle")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.shadowOpacity = 0.75
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        movieCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: "yo")
        
        backgroundColor = UIColor.backgroundColor
        
        setupHeaderLabel()
        setupCollectionView()
        setupButton()

    }
    
    func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.layout(using: [
            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            headerLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            headerLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    func setupCollectionView() {
        addSubview(movieCollectionView)
        movieCollectionView.layout(using: [
            movieCollectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            movieCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            movieCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            movieCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupButton() {
        movieCollectionView.addSubview(shuffleButton)
        shuffleButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        shuffleButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        shuffleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        shuffleButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
