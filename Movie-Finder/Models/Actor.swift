//
//  Actor.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/3/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

struct Cast: Decodable {
    let cast_id: Int
    let name: String?
    let profile_path: String?
}

