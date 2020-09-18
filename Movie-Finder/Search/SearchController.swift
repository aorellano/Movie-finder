//
//  SearchController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SearchController: UICollectionViewController{
    let searchController = UISearchController(searchResultsController: nil)
    let client = MovieClient()
    let dataSource = SearchDataSource()
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "searchCell")
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader")
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.backgroundColor
        dataSource.search.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        collectionView.reloadData()
    }
}

extension SearchController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieController()
        vc.movie = dataSource.movies[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/2, height: 80)
    }
}

extension SearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let searchText = searchBar.searchTextField.text!
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
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
}








