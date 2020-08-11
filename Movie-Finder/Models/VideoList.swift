//
//  VideoList.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/10/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

struct VideoList: Decodable {
    var results: [Video]
    
    init(results: [Video]) {
        self.results = results
    }
}
