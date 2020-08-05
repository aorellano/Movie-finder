//
//  SearchDataSource.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SearchDataSource: NSObject, UICollectionViewDataSource {

    var data = [Movie]()
    let search = UISearchBar()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! MovieCell
        let movie = object(at: indexPath)
        cell.setup(movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader", for: indexPath)
            
            
            search.placeholder = "Search Movies"
            
            search.backgroundImage = UIImage()
            search.sizeToFit()
            
            search.showsCancelButton = false
            let textFieldInsideSearch = search.value(forKey: "searchField") as? UITextField
            textFieldInsideSearch?.textColor = .white
            headerView.addSubview(search)
             return headerView
         }

         return UICollectionReusableView()
    }
}

extension SearchDataSource {
    func update(with data: [Movie]) {
        self.data = data
    }
    
    func object(at indexPath: IndexPath) -> Movie {
        return data[indexPath.row]
    }
}


