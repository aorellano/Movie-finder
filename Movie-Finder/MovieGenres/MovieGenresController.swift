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
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MovieGenreCell
        tableViewTouchesCount += 1
        
        if tableViewTouchesCount == 1 {
            let query = dataSource.object(at: indexPath).name
            loadSubgenres(with: query)
        } else {
            cell.title.textColor = UIColor.highlightColor
            UIView.animate(withDuration: 0.05, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                    cell.contentView.transform = CGAffineTransform(scaleX: 1.02, y: 1.02)
            }) { finished in
                UIView.animate(withDuration: 1.0, animations: {
                    cell.contentView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
            }
        }
        movieGenresView.selectButton.setTitle("Select (\(tableViewTouchesCount-1))", for: .normal)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableViewTouchesCount -= 1
        let cell = tableView.cellForRow(at: indexPath) as! MovieGenreCell
        cell.title.textColor = .white
        UIView.animate(withDuration: 0.10, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.contentView.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }) { finished in
            UIView.animate(withDuration: 1.0, animations: {
                cell.contentView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }
        movieGenresView.selectButton.setTitle("Select (\(tableViewTouchesCount-1))", for: .normal)
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! MovieGenreCell
        
        cell.title.textColor = cell.isSelected ? UIColor.highlightColor : UIColor.white
        
        cell.alpha = 0
                UIView.animate(withDuration: 0.25, delay: 0.04 * Double(indexPath.row), animations:  {
            cell.alpha = 1
        })
    }
}


