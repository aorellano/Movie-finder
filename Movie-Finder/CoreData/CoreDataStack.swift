//
//  CoreDataStack.swift
//  Movie-Finder
//
//  Created by Alexis Orellano on 1/27/22.
//  Copyright © 2022 Alexis Orellano. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
  static let shared = CoreDataStack(modelName: "SavedMovie")
  private let modelName: String

  init(modelName: String) {
    self.modelName = modelName
  }

  lazy var managedContext: NSManagedObjectContext = {
    return self.storeContainer.viewContext
  }()

  private lazy var storeContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: self.modelName)
    container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        print("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()

  func saveContext () {
    guard managedContext.hasChanges else { return }

    do {
      try managedContext.save()
    } catch let nserror as NSError {
      print("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }
}
