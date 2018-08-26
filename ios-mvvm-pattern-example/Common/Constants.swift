//
//  Constants.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 11/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

struct Constants {
    
    struct API {
        static let baseUrl = URL(string: "https://api.themoviedb.org/3/")!
        static let apiKey = "put_your_api_key_here"
    }
    
    struct Common {
        static let maxRating = 10
    }
    
}
