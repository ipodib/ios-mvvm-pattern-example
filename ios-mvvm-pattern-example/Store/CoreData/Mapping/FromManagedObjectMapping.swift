//
//  ModelFromManagedObjectMapping.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 8/28/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper

protocol FromManagedObjectMapping {
    associatedtype T: Mappable
    
    func asMappable() -> T
}
