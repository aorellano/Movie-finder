//
//  RecentDataSource.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 6/2/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class RecentMoviesDataSource: NSObject, UICollectionViewDataSource{
    var data = [[Movie]]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yo", for: indexPath) as! HomeCell

        cell.data = data[indexPath.row]
        if indexPath.row == 0 {
            cell.title.text = "Now Playing"
        } else if indexPath.row == 1 {
            cell.title.text = "Popular"
        } else if indexPath.row == 2 {
            cell.title.text = "Top Rated"
        } else {
            cell.title.text = "Coming Soon"
        }
        return cell
    }
}

extension RecentMoviesDataSource {
    func update(with data: [[Movie]]) {
        self.data = data
    }
}



