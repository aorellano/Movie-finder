//
//  ActorList.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/3/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class CastList: Decodable {
    let cast: [Cast]
    
    init(cast: [Cast]) {
        self.cast = cast
    }
}
