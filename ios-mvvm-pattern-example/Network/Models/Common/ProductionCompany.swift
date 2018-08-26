//
//  ProductionCompany.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class ProductionCompany: Mappable {
    
    var id: Int!
    var logoPath: String?
    var name: String?
    var originCountry: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        logoPath <- map["logo_path"]
        name <- map["name"]
        originCountry <- map["origin_country"]
    }
}

extension ProductionCompany: CoreDataMapping {
    
    func mapToManagedObject(with context: NSManagedObjectContext) -> CRProductionCompany {
        let object: CRProductionCompany = context.insertObject()
        object.id = Double(id)
        object.logoPath = logoPath
        object.name = name
        object.originCountry = originCountry
        return object
    }
    
}
