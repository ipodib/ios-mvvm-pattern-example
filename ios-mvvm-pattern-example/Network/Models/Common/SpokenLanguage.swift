//
//  SpokenLanguage.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class SpokenLanguage: Mappable {
    
    var name: String?
    var iso639_1: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        iso639_1 <- map["iso_639_1"]
    }
    
}

extension SpokenLanguage: CoreDataMapping {
    
    func mapToManagedObject(with context: NSManagedObjectContext) -> CRSpokenLanguage {
        let object: CRSpokenLanguage = context.insertObject()
        object.name = name
        object.iso639_1 = name
        return object
    }
    
}
