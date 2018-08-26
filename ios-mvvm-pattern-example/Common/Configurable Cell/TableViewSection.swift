//
//  MovieDetailsSection.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 16/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class TableViewSection {
    
    let name: String
    let items: [TableViewCellItem]
    
    init(_ name: String, _ items: [TableViewCellItem]) {
        self.name = name
        self.items = items
    }
    
}
