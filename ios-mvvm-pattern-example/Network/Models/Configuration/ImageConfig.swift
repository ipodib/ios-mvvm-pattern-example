//
//  ImageConfig.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 14/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper

class ImageConfig: Mappable {
    
    var baseUrl: URL?
    var secureBaseUrl: URL?
    var backdropSizes: [String]?
    var logoSizes: [String]?
    var posterSizes: [String]?
    var profileSizes: [String]?
    var stillSizes: [String]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        baseUrl <- (map["base_url"], URLTransform())
        secureBaseUrl <- (map["secure_base_url"], URLTransform())
        backdropSizes <- map["backdrop_sizes"]
        logoSizes <- map["logo_sizes"]
        posterSizes <- map["poster_sizes"]
        profileSizes <- map["profile_sizes"]
        stillSizes <- map["still_sizes"]
    }
    
}

extension ImageConfig {
    
    func fullImageUrl(path: String?) -> URL? {
        guard let path = path else {
            return nil
        }
        return secureBaseUrl?.appendingPathComponent("w185").appendingPathComponent(path)
    }
    
}
