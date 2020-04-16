//
//  Result.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/16/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
