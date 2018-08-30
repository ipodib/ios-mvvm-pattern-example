//
//  Collection.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class MovieCollection: Mappable {
    
    var id: Int!
    var name: String?
    var posterPath: String?
    var backdropPath: String?
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["poster_path"]
        backdropPath <- map["backdrop_path"]
    }
    
}

extension MovieCollection: ToManagedObjectMapping {
    
    func asManagedObject(with context: NSManagedObjectContext) -> CRMovieCollection {
        let object: CRMovieCollection = context.insertObject()
        object.id = Double(id)
        object.name = name
        object.posterPath = posterPath
        object.backdropPath = backdropPath
        return object
    }
    
}

extension CRMovieCollection: FromManagedObjectMapping {
    
    func asMappable() -> MovieCollection {
        let object = MovieCollection()
        object.id = Int(id)
        object.name = name
        object.posterPath = posterPath
        object.backdropPath = backdropPath
        return object
    }
    
}
