//
//  RecentMoviesStackView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/27/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class RecentMoviesStackView: UIView {
    let nowPlayingButton: UIButton = {
        let button = UIButton()
        let attributes = [NSAttributedString.Key.font: UIFont.recentMovieFont, NSAttributedString.Key.foregroundColor: UIColor.highlightColor]
        button.setAttributedTitle(NSAttributedString(string: "Now Playing", attributes: attributes as [NSAttributedString.Key : Any]), for: .normal)
        button.tag = 0
        
        return button
    }()
    
    let comingSoonButton: UIButton = {
        let button = UIButton()
        let attributes = [NSAttributedString.Key.font: UIFont.genreFont, NSAttributedString.Key.foregroundColor: UIColor.white]
        button.setAttributedTitle(NSAttributedString(string: "Coming Soon", attributes: attributes as [NSAttributedString.Key : Any]), for: .normal)
        button.tag = 1
        return button
    }()
    
    lazy var recentMoviesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nowPlayingButton, comingSoonButton])
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        //stackView.spacing = 30
        return stackView
    }()
    
    let firstUnderline: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.highlightColor
        return line
    }()
    
    let secondUnderline: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.highlightColor
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
        setupUnderlines()
    }
    
    func setupStackView() {
        addSubview(recentMoviesStackView)
        recentMoviesStackView.layout(using: [
            recentMoviesStackView.topAnchor.constraint(equalTo: topAnchor),
            recentMoviesStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recentMoviesStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            recentMoviesStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupUnderlines() {
        let nowPlayingButton = recentMoviesStackView.arrangedSubviews[0]
        let comingSoonButton = recentMoviesStackView.arrangedSubviews[1]
        nowPlayingButton.addSubview(firstUnderline)
        comingSoonButton.addSubview(secondUnderline)
        
        firstUnderline.layout(using: [
            firstUnderline.leadingAnchor.constraint(equalTo: nowPlayingButton.leadingAnchor, constant: 40),
            firstUnderline.trailingAnchor.constraint(equalTo: nowPlayingButton.trailingAnchor, constant: -40),
            firstUnderline.topAnchor.constraint(equalTo: nowPlayingButton.bottomAnchor, constant: -5),
            firstUnderline.heightAnchor.constraint(equalToConstant: 1.5)
        ])
        
        secondUnderline.layout(using: [
            secondUnderline.leadingAnchor.constraint(equalTo: comingSoonButton.leadingAnchor, constant: 40),
            secondUnderline.trailingAnchor.constraint(equalTo: comingSoonButton.trailingAnchor, constant: -40),
            secondUnderline.topAnchor.constraint(equalTo: comingSoonButton.bottomAnchor, constant: -5),
            secondUnderline.heightAnchor.constraint(equalToConstant: 1.5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
