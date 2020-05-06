//
//  Movie.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/4/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

struct Movie: Decodable {
    var id: Int
    var title: String
    var poster_path: String?
}
