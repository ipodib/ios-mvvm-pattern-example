//
//  SearchRouter.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 11/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import Alamofire

enum SearchRouter: ApiRouterProtocol {
    
    case search(query: String)
    
    var path: String {
        return "search/movie"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        switch self {
        case .search(let query):
            return ["query": query]
        }
    }
}
