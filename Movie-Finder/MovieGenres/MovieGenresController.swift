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
                self.dataSource.update(with: genreResults.genres)
                self.movieGenresView.genresTableView.reloadData()
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
        let cell = tableView.cellForRow(at: indexPath) as! MovieGenreCell
        tableViewTouchesCount += 1
        
        if tableViewTouchesCount == 1 {
            let query = dataSource.object(at: indexPath).name
            loadSubgenres(with: query)
        } else {
            
        }
    }
    
    func loadSubgenres(with query: String) {
        movieGenresView.selectButton.isHidden = false
        
        client.getSubgenres(from: .subGenre(term: query, page: "1")) { result  in
            switch result {
            case .success(let subgenreResults):
                self.fetch(pages: subgenreResults.total_pages, with: query)
            case .failure(let error):
                    print(error)
            }
        }
    }
    
    func fetch(pages: Int, with query: String) {
        var temp = [Genre]() {
            didSet {
                self.dataSource.update(with: temp)
                movieGenresView.genresTableView.reloadData()
            }
        }
        
        for i in 1...pages {
            client.getSubgenres(from: .subGenre(term: query, page: String(i))) { result  in
                switch result {
                case .success(let subgenreResults):
                    temp += subgenreResults.results
                
                case .failure(let error):
                        print(error)
                }
            }
        }
    }
}


