//
//  MenuView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/5/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    var movieBackdrop: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
//               let blurEffectView = UIVisualEffectView(effect: blurEffect)
//               blurEffectView.frame = imageView.bounds
//               blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//                blurEffectView.alpha = 0.60
//               imageView.addSubview(blurEffectView)
        return imageView
    }()
    
    var darkContainer: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
     let menuTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.recentMovieFont
        label.textColor = UIColor.titleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.backgroundColor
    }
    
    override func layoutSubviews() {
        setupContentView()
        setupBackdrop()
        setupMenuTitle()
    }
    
    func setup(_ imagePath: String) {
        let backdropPath = imagePath ?? ""
        movieBackdrop.downloadImage(imageType: .backdrop, path: backdropPath)
    }
    
    func setupContentView() {
        contentView.backgroundColor = .blue
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15))
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0))
        //contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        //contentView.layer.borderWidth = 0.50
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 10
       
    }
    
    func setupBackdrop() {
        contentView.addSubview(movieBackdrop)
        movieBackdrop.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieBackdrop.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        movieBackdrop.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        movieBackdrop.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(darkContainer)
        darkContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        darkContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        darkContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        darkContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func setupMenuTitle() {
        addSubview(menuTitle)
        menuTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        menuTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
