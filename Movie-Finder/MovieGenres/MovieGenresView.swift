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
        tableView.layer.cornerRadius = 30
        tableView.allowsMultipleSelection = true
        return tableView
    }()
    
    let selectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.tintColor
        button.layer.cornerRadius = 10
        button.isHidden = true
        button.addTarget(self, action: #selector(MovieGenresController.genresSelected), for: .touchUpInside)
        button.setTitle("Select", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        setupHeaderLabel()
        setupTableView()
        setupSelectButton()
    }
    

    
    fileprivate func setupHeaderLabel() {
        addSubview(headerLabel)

        headerLabel.layout(using: [
            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            headerLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            headerLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    fileprivate func setupTableView() {
        addSubview(genresTableView)
        
        genresTableView.layout(using: [
            genresTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 40),
            genresTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            genresTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            genresTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    fileprivate func setupSelectButton() {
        genresTableView.addSubview(selectButton)
        
        selectButton.layout(using: [
            selectButton.topAnchor.constraint(equalTo: genresTableView.bottomAnchor, constant: 15),
            selectButton.heightAnchor.constraint(equalToConstant: 60),
            selectButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
