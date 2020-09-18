//
//  String+Extension.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 9/17/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

extension String {
    var formatDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
