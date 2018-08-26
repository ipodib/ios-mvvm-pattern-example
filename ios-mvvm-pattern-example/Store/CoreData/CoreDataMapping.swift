//
//  CoreDataMapping.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 26/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataMapping {
    associatedtype T: NSManagedObject
    
    func mapToManagedObject(with context: NSManagedObjectContext) -> T
    
}
