//
//  MovieGenresDataSource.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieGenresDataSource: NSObject {
    var movies = [Genre]()
    
    override init() {
        super.init()
    }
}

extension MovieGenresDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MovieGenreCell
        
        let genre = object(at: indexPath)
        cell.setup(genre)

        return cell
    }
}

extension MovieGenresDataSource {
    func object(at indexPath: IndexPath) -> Genre {
        return movies[indexPath.row]
    }
    
    func update(with data: [Genre]) {
        self.movies = data
    }
}

