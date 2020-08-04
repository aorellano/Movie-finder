//
//  ActorsDataSource.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/3/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class ActorsDataSource: NSObject, UICollectionViewDataSource {
    var data = [Cast]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "actorCell", for: indexPath) as! ActorCell
        let actor = object(at: indexPath)
        cell.setup(actor)
        return cell
    }
}

extension ActorsDataSource {
    func update(with data: [Cast]) {
        self.data = data
    }
    
    func object(at indexPath: IndexPath) -> Cast {
        return data[indexPath.row]
    }
}
