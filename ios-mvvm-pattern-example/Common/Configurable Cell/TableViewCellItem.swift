//
//  CellItem.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 16/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

protocol TableViewCellItem {
    
    /// Cell identifier that is used to deque table view cell
    var cellIdentifier: String { get }
    
}
