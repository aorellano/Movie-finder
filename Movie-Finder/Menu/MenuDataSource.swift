//
//  MenuDataSource.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/5/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MenuDataSource: NSObject, UITableViewDataSource {
    var data = [Movie]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        if indexPath.row == 0 {
            cell.menuTitle.text = "Random Movie"
        } else if indexPath.row == 1 {
            cell.menuTitle.text = "Search by Genre"
        } else if indexPath.row == 2 {
            cell.menuTitle.text = "Your Movies"
        } else if indexPath.row == 3 {
            cell.menuTitle.text = "Settings"
        } else {
            cell.menuTitle.text = "Sign In"
        }
        let backdropPath = object(at: indexPath)
        cell.setup(backdropPath)
        return cell
    }
}

extension MenuDataSource {
    func update(with data: [Movie]) {
        self.data = data
        print(data)
    }
    func object(at indexPath: IndexPath) -> String {
        return data[indexPath.row].backdrop_path!
    }
}
