//
//  SubGenre.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/30/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SubgenreList: Decodable {
    var results: [Genre]
    var total_pages: Int
    
    init(results: [Genre], total_pages: Int) {
        self.results = results
        self.total_pages = total_pages
    }
}

