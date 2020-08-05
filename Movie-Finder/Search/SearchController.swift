//
//  SearchController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    let searchController = UISearchController(searchResultsController: nil)
        let client = MovieClient()
    let dataSource = SearchDataSource()
    
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "searchCell")
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader")
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        //collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

        
        collectionView.backgroundColor = UIColor.backgroundColor
        dataSource.search.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/2, height: 80)
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        if(!(searchBar.text?.isEmpty)!){
//            //reload your data source if necessary
//        }
        print("Searching for this movie")
        searchBar.resignFirstResponder()
        var searchText = searchBar.searchTextField.text!
        client.recommendMovies(from: .search(movie: searchText)) { result in
            switch result {
            case .success(let result):
                self.dataSource.update(with: result.results)
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
        searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Hi")
        
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

}








