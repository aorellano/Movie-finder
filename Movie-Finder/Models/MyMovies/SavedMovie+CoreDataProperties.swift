//
//  Movie+CoreDataProperties.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 8/13/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//
//

import Foundation
import CoreData

extension SavedMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedMovie> {
        return NSFetchRequest<SavedMovie>(entityName: "SavedMovie")
    }

    @NSManaged public var backdrop_path: String?
    @NSManaged public var id: Int32
    @NSManaged public var overview: String?
    @NSManaged public var poster_path: String?
    @NSManaged public var release_date: String?
    @NSManaged public var title: String?
    @NSManaged public var vote_average: Double
    @NSManaged public var seen: Bool
    @NSManaged public var rating: Int16
}
