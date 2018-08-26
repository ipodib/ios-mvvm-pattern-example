//
//  SearchResult.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 11/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchResult: Mappable {
    
    var page: Int?
    var totalPages: Int?
    var totalResults: Int?
    var results: [Movie]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        totalPages <- map["total_pages"]
        totalResults <- map["total_results"]
        results <- map["results"]
    }
    
}
