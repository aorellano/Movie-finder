//
//  DropDownView.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/19/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class DropDownView: UIView {
    
    var dropDownOptions  = ["Popularity Desc.", "Popularity Asc.", "Release Date Desc.", "Release Asc.", "Vote Average Desc.", "Vote Average Asc."]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "filterCell")
        tableView.backgroundColor = UIColor.backgroundColor
        tableView.separatorColor = UIColor.accentColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.allowsMultipleSelection = true
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        tableView.backgroundColor = UIColor.accentColor
        
        
        tableViewSetup()
    }
    
    func tableViewSetup() {
        
        
        self.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


