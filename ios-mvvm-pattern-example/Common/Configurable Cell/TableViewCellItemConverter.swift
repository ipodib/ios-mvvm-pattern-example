//
//  TableViewCellItemConverter.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 16/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

protocol TableViewCellItemConverter {
    
    associatedtype Data
    associatedtype Item
    
    /// Generate list of items from data. Use it as generating items that describes table view sections or cells.
    ///
    /// - Parameter data: Data to be converted.
    /// - Returns: List of items.
    func convert(from data: Data) -> [Item]
    
}
