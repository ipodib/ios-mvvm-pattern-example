//
//  NSPersistentContainer+Load.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 26/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import CoreData

extension NSPersistentContainer {
    
    class func loadStorageModel() -> NSPersistentContainer {
        let container = NSPersistentContainer(name: "StorageModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print(error.localizedDescription)
            }
        })
        return container
    }
    
}
