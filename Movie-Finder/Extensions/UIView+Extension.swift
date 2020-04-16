//
//  UIView+Extension.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 4/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

extension UIView {
    func layout(using constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}
