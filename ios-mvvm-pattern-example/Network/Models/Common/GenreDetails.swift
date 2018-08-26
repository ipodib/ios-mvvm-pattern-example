//
//  GenreDetails.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class GenreDetails: Mappable {
    
    var id: Int!
    var name: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
}

extension GenreDetails: CoreDataMapping {
    
    func mapToManagedObject(with context: NSManagedObjectContext) -> CRGenreDetails {
        let object: CRGenreDetails = context.insertObject()
        object.id = Double(id)
        object.name = name
        return object
    }
    
}
