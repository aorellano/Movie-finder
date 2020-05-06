//
//  MovieGenresDataSource.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieGenresDataSource: NSObject {
    var data = [Genre]()
    var selectedData = [Int]()
    
    override init() {
        super.init()
    }
}

extension MovieGenresDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MovieGenreCell
        
        let genre = object(at: indexPath)
        cell.setup(genre)

        return cell
    }
}

extension MovieGenresDataSource {
    func object(at indexPath: IndexPath) -> Genre {
        return data[indexPath.row]
    }
    
    func update(with data: [Genre]) {
        self.data = data
    }
    
    func add(id: Int) {
        self.selectedData.append(id)
    }
    
    func remove(id: Int) {
        self.selectedData.removeAll(where: {$0 == id})
    }
    
//    func genreIds() -> [Int] {
//        var genreIds = [Int]()
//        for genre in selectedData {
//            print("man\(genre.id)")
//            genreIds.append(genre.id)
//        }
//        return genreIds
//    }
}

