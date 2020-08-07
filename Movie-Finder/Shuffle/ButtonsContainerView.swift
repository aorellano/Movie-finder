//
//  ButtonsContainerView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/6/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class ButtonsContainerView: UIView {
    let shuffleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let image = UIImage(named: "shuffle")
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 35
        button.layer.shadowOpacity = 0.75
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let watchListButton: UIButton = {
         let button = UIButton()
         button.setTitle("Watch List", for: .normal)
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
        translatesAutoresizingMaskIntoConstraints = false
        setupShuffleButton()
        setupSeenItButton()
        setupWatchItButton()
    }
    
    
    
    func setupShuffleButton() {
        addSubview(shuffleButton)
        
        shuffleButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        shuffleButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        shuffleButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        shuffleButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setupSeenItButton() {
        addSubview(seenItListButton)
        seenItListButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        seenItListButton.trailingAnchor.constraint(equalTo: shuffleButton.leadingAnchor, constant: -10).isActive = true
        seenItListButton.centerYAnchor.constraint(equalTo: shuffleButton.centerYAnchor).isActive = true
        seenItListButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupWatchItButton() {
        addSubview(watchListButton)
        watchListButton.leadingAnchor.constraint(equalTo: shuffleButton.trailingAnchor, constant: 10).isActive = true
        watchListButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        watchListButton.centerYAnchor.constraint(equalTo: shuffleButton.centerYAnchor).isActive = true
        watchListButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
