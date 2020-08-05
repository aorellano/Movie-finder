//
//  MovieCell.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/5/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell{
    let dataSource = HomeDataSource()
    
    var data = [Movie](){
        didSet {
            dataSource.update(with: data)
        }
    }
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Section Title"
        label.font = UIFont.genreFont
        label.textColor = UIColor.accentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2.8, height: UIScreen.main.bounds.height/3.5)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "hi")
        collectionView.backgroundColor = UIColor.backgroundColor
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        collectionView.dataSource = dataSource
        setupTitle()
        setupCollectionView()
        collectionView.dataSource = dataSource
        dataSource.update(with: data)
    }

    func setupTitle() {
        addSubview(title)
        title.topAnchor.constraint(equalTo: topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }
    
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
