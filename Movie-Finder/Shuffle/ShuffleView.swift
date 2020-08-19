//
//  ShuffleView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/6/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class ShuffleView: UIView {
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Recommended\nMovie"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.secondaryTitleFont
        label.textColor = UIColor.highlightColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieView = MovieCellView()
    
    let buttonsContainerView = ButtonsContainerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        movieView.translatesAutoresizingMaskIntoConstraints = false
        setupHeaderLabel()
        setupMovieView()
        setupButtons()
    }
    
    func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
    }
    
    func setupMovieView() {
        addSubview(movieView)
        movieView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        movieView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        movieView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        movieView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30).isActive = true
    }
    
    func setupButtons() {
        addSubview(buttonsContainerView)
        buttonsContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        buttonsContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        buttonsContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        buttonsContainerView.topAnchor.constraint(equalTo: movieView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
