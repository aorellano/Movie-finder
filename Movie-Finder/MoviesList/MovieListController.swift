//
//  RecentMoviesController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/24/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
import CoreData

class MovieListController: UIViewController {
    let movieListView = MovieListView()
    let dataSource = MovieListDataSource()
    let movieFetch: NSFetchRequest<SavedMovie> = SavedMovie.fetchRequest()
    lazy var seenPredicate: NSPredicate = {
        return NSPredicate(format: "seen = %@",
            NSNumber(value: true))
    }()
    lazy var watchPredicate: NSPredicate = {
        return NSPredicate(format: "seen == %@",
            NSNumber(value: false))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActions()
        fetchAndReloadMovies(with: watchPredicate)
    }
    
    func setupActions() {
        movieListView.movieListCollectionView.dataSource = dataSource
        movieListView.movieListCollectionView.delegate = self
        movieListView.recentMoviesStackView.watchListButton.addTarget(self, action: #selector(watchListButtonPressed), for: .touchUpInside)
        movieListView.recentMoviesStackView.seenListButton.addTarget(self, action: #selector(seenListButtonPressed), for: .touchUpInside)
        dataSource.watchList = false
    }
    
    @objc func watchListButtonPressed() {
        buttonPressed(button: movieListView.recentMoviesStackView.watchListButton)
        dataSource.update(with:  MyMovieList.watchMovies)
        movieListView.movieListCollectionView.reloadData()
        dataSource.watchList = false
        fetchAndReloadMovies(with: watchPredicate)
    }
    
    func fetchAndReloadMovies(with predicate: NSPredicate) {
      do {
          movieFetch.resultType = .managedObjectResultType
          movieFetch.predicate = predicate
          MyMovieList.watchMovies = try CoreDataStack.shared.managedContext.fetch(movieFetch)
          dataSource.update(with: MyMovieList.watchMovies)
          movieListView.movieListCollectionView.reloadData()
      } catch let error as NSError {
        print("Could not fetch \(error), \(error.userInfo)")
      }
    }
    
    @objc func seenListButtonPressed() {
        buttonPressed(button: movieListView.recentMoviesStackView.seenListButton)
        dataSource.watchList = true
        fetchAndReloadMovies(with: seenPredicate)
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


