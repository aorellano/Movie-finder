//
//  HomeDataSource.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
    var data = [Movie]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hi", for: indexPath) as! MovieCell
        
        cell.setup(data[indexPath.row])
        cell.backgroundColor = UIColor.backgroundColor
        return cell
    }
}

extension HomeDataSource {
    func update(with data: [Movie]) {
        self.data = data
    }
}
