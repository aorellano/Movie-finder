//
//  MovieListDataSource.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/7/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieListDataSource: NSObject, UICollectionViewDataSource {
    var data = [SavedMovie]()
    var watchList: Bool!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieListCell", for: indexPath) as! MovieListCell
        let movie = object(at: indexPath)
        cell.setup(movie, watchList)
        return cell
    }
}

extension MovieListDataSource {
    func update(with data: [SavedMovie]) {
        self.data = data
    }
    
    func object(at indexPath: IndexPath) -> SavedMovie {
        return data[indexPath.row]
    }
}
