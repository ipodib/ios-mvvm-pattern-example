//
//  ProductionCountry.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class ProductionCountry: Mappable {
    
    var name: String?
    var iso3166_1: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        iso3166_1 <- map["iso_3166_1"]
    }
    
}

extension ProductionCountry: CoreDataMapping {
    
    func mapToManagedObject(with context: NSManagedObjectContext) -> CRProductionCountry {
        let object: CRProductionCountry = context.insertObject()
        object.iso3166_1 = iso3166_1
        object.name = name
        return object
    }
    
}
