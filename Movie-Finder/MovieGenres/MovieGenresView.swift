//
//  MovieGenresView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieGenresView: UIView {
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you feel like watching today?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.secondaryTitleFont
        label.textColor = UIColor.highlightColor
        return label
    }()
    
    let genresTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MovieGenreCell.self, forCellReuseIdentifier: "cellId")
        tableView.backgroundColor = UIColor.backgroundColor
        tableView.separatorColor = UIColor.backgroundColor
        tableView.layer.cornerRadius = 30
        tableView.allowsMultipleSelection = true
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        setupHeaderLabel()
        setupTableView()
    }
    
    fileprivate func setupHeaderLabel() {
        addSubview(headerLabel)

        headerLabel.layout(using: [
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    fileprivate func setupTableView() {
        addSubview(genresTableView)
        
        genresTableView.layout(using: [
            genresTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            genresTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            genresTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            genresTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
