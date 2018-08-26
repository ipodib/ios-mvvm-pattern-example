//
//  NSManagedObjectContext+Create.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 26/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    /// Insert new object.
    ///
    /// - Returns: Created managed object.
    func insertObject<T: NSManagedObject>() -> T {
        guard let entityName = T.entity().name else {
            fatalError("Entity does not have a name.")
        }
        
        guard let object = NSEntityDescription.insertNewObject(forEntityName: entityName, into: self) as? T else {
            fatalError("Wrong object type.")
        }
        
        return object
    }
    
    /// Try to save context changes.
    ///
    /// - Returns: True if changes were stored successfully. Otherwise false.
    func saveOrRollback() {
        do {
            try save()
        } catch {
            rollback()
            print(error.localizedDescription)
        }
    }
}
