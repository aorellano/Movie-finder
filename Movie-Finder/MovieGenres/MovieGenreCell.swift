//
//  MovieGenreCell.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/10/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieGenreCell: UITableViewCell {
    let genreTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.backgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubviewShape()
        addSubviewShadow()
        
        
        contentView.backgroundColor = .red

    }
    
    func addSubviewShape() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20))
        contentView.layer.cornerRadius = 15
    }
    
    func addSubviewShadow() {
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 1.5, height: 2.5)
        contentView.layer.shadowRadius = 1.0
        contentView.layer.shadowOpacity = 0.20
        contentView.layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
