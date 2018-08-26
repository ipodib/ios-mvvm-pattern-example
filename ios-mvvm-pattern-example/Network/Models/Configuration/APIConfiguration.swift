//
//  APIConfiguration.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 14/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper

class APIConfiguration: Mappable {
    
    var images: ImageConfig?
    var changeKeys: [String]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        images <- map["images"]
        changeKeys <- map["change_keys"]
    }
    
}
