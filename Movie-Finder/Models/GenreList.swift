//
//  GenreList.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/27/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class GenreList: Decodable {
    static var shared: [Genre]? = nil
    var genres: [Genre]?
}
