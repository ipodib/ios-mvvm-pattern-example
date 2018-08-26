//
//  CoreDataStore.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 25/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import CoreData

class CoreDataContainer {
    
    static let `default`: CoreDataContainer = {
        return CoreDataContainer()
    }()
    
    let viewContext: NSManagedObjectContext
    let writeContext: NSManagedObjectContext
    private let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer.loadStorageModel()
        viewContext = persistentContainer.viewContext
        writeContext = persistentContainer.newBackgroundContext()
        writeContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        writeContext.automaticallyMergesChangesFromParent = true
    }
    
}

