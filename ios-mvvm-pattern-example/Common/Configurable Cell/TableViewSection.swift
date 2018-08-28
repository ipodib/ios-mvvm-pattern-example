//
//  MovieDetailsSection.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 16/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import RxDataSources

struct TableViewSection: SectionModelType {
    
    var name: String
    var items: [TableViewCellItem]
    
    init(original: TableViewSection, items: [TableViewCellItem]) {
        self = original
        self.items = items
    }
    
    init(_ name: String, _ items: [TableViewCellItem]) {
        self.name = name
        self.items = items
    }
    
}
