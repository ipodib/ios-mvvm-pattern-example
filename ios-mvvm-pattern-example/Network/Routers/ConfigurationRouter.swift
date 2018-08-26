//
//  ConfigurationRouter.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 14/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import Alamofire

enum ConfigurationRouter: ApiRouterProtocol {
    
    case loadConfiguration
    
    var path: String {
        return "configuration"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}
