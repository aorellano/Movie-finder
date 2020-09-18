//
//  HomeDataSource.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
    var movies = [Movie]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryMovie", for: indexPath) as! MovieCell
        let movie = object(at: indexPath)
        cell.setup(movie)
        return cell
    }
}

extension HomeDataSource {
    func update(with movies: [Movie]) {
        self.movies = movies
    }
    
    func object(at indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
}
