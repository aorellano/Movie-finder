//
//  SimilarMoviesDataSource.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/10/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SimilarMoviesDataSource: NSObject, UICollectionViewDataSource {
    var data = [Movie]()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "similarCell", for: indexPath) as! MovieCell
            let movie = object(at: indexPath)
            cell.setup(movie)
        return cell
    }
}

extension SimilarMoviesDataSource {
    func update(with data: [Movie]) {
        self.data = data
    }
        
    func object(at indexPath: IndexPath) -> Movie {
        return data[indexPath.row]
    }
}
