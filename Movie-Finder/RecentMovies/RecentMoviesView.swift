//
//  RecentMoviesView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/24/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class RecentMoviesView: UIView {
//
//    let firstUnderline: UIView = {
//        let line = UIView()
//        line.backgroundColor = UIColor.highlightColor
//        return view
//    }()
//
    let nowPlayingButton: UIButton = {
        let button = UIButton()
        let attributes = [NSAttributedString.Key.font: UIFont.genreFont, NSAttributedString.Key.foregroundColor: UIColor.white]
        button.setAttributedTitle(NSAttributedString(string: "Now Playing", attributes: attributes as [NSAttributedString.Key : Any]), for: .normal)
        
        let line = UIView()
        line.backgroundColor = UIColor.white
        button.addSubview(line)
        line.layout(using: [
            line.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 50),
            line.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -50),
            line.topAnchor.constraint(equalTo: button.bottomAnchor, constant: -5),
            line.heightAnchor.constraint(equalToConstant: 1.5)
        ])
        return button
    }()
    
    let comingSoonButton: UIButton = {
        let button = UIButton()
               

        let attributes = [NSAttributedString.Key.font: UIFont.genreFont, NSAttributedString.Key.foregroundColor: UIColor.white]
        button.setAttributedTitle(NSAttributedString(string: "Coming Soon", attributes: attributes as [NSAttributedString.Key : Any]), for: .normal)
        
        return button
    }()
    
//    let secondUnderline: UIView = {
//        let line = UIView()
//        line.backgroundColor = .white
//        return view
//    }()
//
    lazy var recentMoviesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nowPlayingButton, comingSoonButton])
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        //stackView.spacing = 30
        return stackView
    }()
    
    
    let recentMoviesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .blue
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundColor
        
        recentMoviesCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: "yo")
        setupRecentMoviesStackView()
        //setupUnderlines()
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
    
//    func setupUnderlines() {
//        addSubview(firstUnderline)
//        addSubview(secondUnderline)
//        
//        firstUnderline.layout(using: [
//            firstUnderline.leadingAnchor.constraint(equalTo: recentMoviesStackView.tag.leadingAnchor),
//            firstUnderline.trailingAnchor.constraint(equalTo: recentMoviesStackView.trailingAnchor),
//            firstUnderline.topAnchor.constraint(equalTo: recentMoviesStackView.bottomAnchor)
//        ])
//        
//        secondUnderline.layout(using: [
//            firstUnderline.leadingAnchor.constraint(equalTo: recentMoviesStackView.leadingAnchor),
//            firstUnderline.trailingAnchor.constraint(equalTo: recentMoviesStackView.trailingAnchor),
//            firstUnderline.topAnchor.constraint(equalTo: recentMoviesStackView.bottomAnchor)
//        ])
//    }
    
    func setupCollectionView() {
        addSubview(recentMoviesCollectionView)
        
        recentMoviesCollectionView.layout(using: [
            recentMoviesCollectionView.topAnchor.constraint(equalTo: recentMoviesStackView.bottomAnchor),
            recentMoviesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recentMoviesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            recentMoviesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
