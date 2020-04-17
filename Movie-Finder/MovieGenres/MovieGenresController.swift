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
    var tableViewTouchesCount = 0
    let client = MovieClient()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieGenresView.genresTableView.dataSource = dataSource
        movieGenresView.genresTableView.delegate = self
        
        client.getGenres(from: .genre){ result in
            switch result {
            case .success(let genreResults):
                guard let genres = genreResults.genres else { return }
                print(genres)
            case .failure(let error):
                print("the error \(error)")
            }
        }
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        view = movieGenresView
    }
}

extension MovieGenresController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewTouchesCount += 1
        
        if tableViewTouchesCount == 1 {
            loadGenres()
        } else {
            loadSubgenres()
        }
    }
    
    func loadGenres() {
        //request genres from database
        
    }
    
    func loadSubgenres() {
        movieGenresView.selectButton.isHidden = false
        //request subgenres from database
    }
}


