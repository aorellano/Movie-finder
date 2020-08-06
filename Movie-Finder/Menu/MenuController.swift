//
//  MenuController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/5/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {
    let dataSource = MenuDataSource()
    let client = MovieClient()
    var favoriteMovies = ["Jaws", "The Shining", "The godfather", "Star Wars", "E.T."]
    var movieResults = [Movie]() {
        didSet {
            if movieResults.count == 5 {
                dataSource.update(with: movieResults)
            }
        }
    }
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        tableView.backgroundColor = UIColor.backgroundColor
        tableView.register(MenuCell.self, forCellReuseIdentifier: "menuCell")
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        for movie in favoriteMovies {
            client.recommendMovies(from: .search(movie: movie)) { result in
                switch result {
                case .success(let result):
                    self.movieResults.append(result.results.first!)
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
        }
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}


