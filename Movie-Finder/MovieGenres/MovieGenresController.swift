//
//  ViewController.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/3/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieGenresController: UIViewController {
    let movieGenresView = MovieGenresView()
    let dataSource = MovieGenresDataSource()
    let client = MovieClient()
    let movieRecommendationController = MovieRecommendationController()
    var tableViewTouchesCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupGenreTableView()
        fetchGenres()
    }
    
    func setupGenreTableView() {
        movieGenresView.genresTableView.dataSource = dataSource
        movieGenresView.genresTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        view = movieGenresView
    }
    
    func fetchGenres() {
        client.getGenres(from: .genre){ result in
            switch result {
            case .success(let genreResults):
                self.dataSource.update(with: genreResults.genres)
                self.movieGenresView.genresTableView.reloadData()
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
}

extension MovieGenresController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genreId = dataSource.object(at: indexPath).id
        let genre = String(genreId)
        
        movieRecommendationController.genre = genre
        movieRecommendationController.fetchRecommendations(with: [genreId])
        navigationController?.pushViewController(movieRecommendationController, animated: false)
    }
}




