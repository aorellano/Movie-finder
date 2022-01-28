//
//  HomeController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    let homeView = HomeView()
    let client = MovieClient()
    var sectionTitles = [String]()
    var movies = [[Movie]]() {
        didSet {
            if movies.count == 4 {
                self.homeView.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.collectionView.dataSource = self
        
        fetchMoviesNowPlaying()
        fetchMoviesUpcoming()
        fetchPopularMovies()
        fetchTopRatedMovies()
    }
    
    func fetchMoviesNowPlaying() {
        client.recommendMovies(from: .nowPlaying) { result in
            switch result {
            case .success(let movies):
                self.movies.append(movies.results)
                self.sectionTitles.append("Now Playing")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchMoviesUpcoming() {
        client.recommendMovies(from: .upcoming) { result in
            switch result {
            case .success(let movies):
                self.movies.append(movies.results)
                self.sectionTitles.append("Upcoming")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchPopularMovies() {
        client.recommendMovies(from: .popular) { result in
            switch result {
            case .success(let movies):
                self.movies.append(movies.results)
                self.sectionTitles.append("Popular")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchTopRatedMovies() {
        client.recommendMovies(from: .topRated) { result in
            switch result {
            case .success(let movies):
                self.movies.append(movies.results)
                self.sectionTitles.append("Top Rated")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func loadView() {
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
}

extension HomeController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCell
        cell.data = movies[indexPath.row]
        cell.setupSectionTitle(with: sectionTitles[indexPath.row])
        cell.presentMovie = { movie in
            let vc = MovieController()
            vc.movie = movie
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
}

