//
//  RecentMoviesController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/24/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieListController: UIViewController {
    let movieListView = MovieListView()
    let dataSource = MovieListDataSource()
//    let client = MovieClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.title = "Tab 1"
        movieListView.movieListCollectionView.dataSource = dataSource
//        recentMoviesView.recentMoviesCollectionView.delegate = self
//
        movieListView.recentMoviesStackView.watchListButton.addTarget(self, action: #selector(watchListButtonPressed), for: .touchUpInside)
        movieListView.recentMoviesStackView.seenListButton.addTarget(self, action: #selector(seenListButtonPressed), for: .touchUpInside)
        
        dataSource.update(with: Data.watchMovies)
        movieListView.movieListCollectionView.reloadData()
        movieListView.movieListCollectionView.delegate = self
//
//        client.recommendMovies(from: .nowPlaying) { result in
//            switch result {
//            case .success(let results):
//                self.dataSource.update(with: results.results)
//                self.recentMoviesView.recentMoviesCollectionView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    @objc func watchListButtonPressed() {
        buttonPressed(button: movieListView.recentMoviesStackView.watchListButton)
        dataSource.update(with:  Data.watchMovies)
        movieListView.movieListCollectionView.reloadData()
        //send datasource array of movies you want to watch
        
//        client.recommendMovies(from: .nowPlaying) { result in
//            switch result {
//            case .success(let results):
//                self.dataSource.update(with: results.results)
//                self.recentMoviesView.recentMoviesCollectionView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
        print("hi")
    }
    
    @objc func seenListButtonPressed() {
        buttonPressed(button: movieListView.recentMoviesStackView.seenListButton)
        dataSource.update(with: Data.seenMovies)
        movieListView.movieListCollectionView.reloadData()
        //send datasource array of movie you have seen
//        client.recommendMovies(from: .upcoming) { result in
//            switch result {
//            case .success(let results):
//                self.dataSource.update(with: results.results)
//                self.recentMoviesView.recentMoviesCollectionView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
     
        print("yo")
    }
    
    func buttonPressed(button: UIButton) {
        let highlightedColor = [NSAttributedString.Key.font: UIFont.genreFont, NSAttributedString.Key.foregroundColor: UIColor.highlightColor]
        let regularColor = [NSAttributedString.Key.font: UIFont.genreFont, NSAttributedString.Key.foregroundColor: UIColor.white]
        if button.tag == 0 {
            movieListView.recentMoviesStackView.firstUnderline.isHidden = false
            movieListView.recentMoviesStackView.secondUnderline.isHidden = true
            
            button.setAttributedTitle(NSAttributedString(string: (button.titleLabel?.text)!, attributes: highlightedColor), for: .normal)
            movieListView.recentMoviesStackView.seenListButton.setAttributedTitle(NSAttributedString(string: "Seen It", attributes: regularColor), for: .normal)
        } else {
            print("there")
            movieListView.recentMoviesStackView.firstUnderline.isHidden = true
            movieListView.recentMoviesStackView.secondUnderline.isHidden = false
            
            button.setAttributedTitle(NSAttributedString(string: (button.titleLabel?.text)!, attributes: highlightedColor), for: .normal)
            movieListView.recentMoviesStackView.watchListButton.setAttributedTitle(NSAttributedString(string: "Watch List", attributes: regularColor), for: .normal)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        movieListView.recentMoviesStackView.secondUnderline.isHidden = true
        
    }
    

    override func loadView() {
        view = movieListView
    }
}

extension MovieListController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width/2.1), height: 300)
    }
}


