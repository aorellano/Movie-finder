//
//  UIImageView+extension.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 5/5/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

extension UIImageView {
    static var cache: [URL: UIImage] = [:]
    
    func downloadImage(imageType: ImageType, path: String) {
        let defaultImage = #imageLiteral(resourceName: "NoImage")
        guard let url = URL(string: imageType.path + path) else {
            print("url could not load")
            
            self.image = defaultImage
            return
        }
        //checks if the image is already in the cache
        if let cached = UIImageView.cache[url] {
            self.image = cached
            return
        }
        
        //if its not it creates it and pusts it in the cache
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let imageData = data, let img = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    UIImageView.cache[url] = img
                    self?.image = img
                    return
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = defaultImage
                }
            }
        }
        task.resume()
    }
}
