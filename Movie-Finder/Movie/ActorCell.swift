//
//  ActorCell.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/3/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class ActorCell: UICollectionViewCell {
    let actorImage: UIImageView =  {
        let image = #imageLiteral(resourceName: "NoImage")
        let imageView = UIImageView()
        imageView.image = image
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 35
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let actorTitle: UILabel = {
        let label = UILabel()
        label.text = "Jeremy Allen White dfhjsfkhsf"
        label.font = UIFont.descriptionFont
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        setupActorImage()
        setupActorTitle()
    }
    
    func setup(_ actor: Cast) {
        let profilePath = actor.profile_path ?? ""
        actorTitle.text = actor.name
        actorImage.downloadImage(imageType: .castImage, path: profilePath)
    }
    
    func setupActorImage() {
        addSubview(actorImage)
        
        actorImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        actorImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        actorImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        actorImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setupActorTitle() {
        addSubview(actorTitle)
        
        actorTitle.topAnchor.constraint(equalTo: actorImage.bottomAnchor, constant: 5).isActive = true
//        actorTitle.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        actorTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        actorTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
