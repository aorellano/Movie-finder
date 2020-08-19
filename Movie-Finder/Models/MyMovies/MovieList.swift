//
//  MovieList.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieList: Decodable {
    let results: [Movie]
    
    init(results: [Movie]) {
        self.results = results
        print(results)
    }
}
