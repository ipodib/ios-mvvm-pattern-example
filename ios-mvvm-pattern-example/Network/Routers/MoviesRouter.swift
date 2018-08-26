//
//  File.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import Alamofire

enum MoviesRouter: ApiRouterProtocol {
    
    case getDetails(id: Int)
    
    var path: String {
        switch self {
        case .getDetails(let id):
            return "movie/\(id)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}
