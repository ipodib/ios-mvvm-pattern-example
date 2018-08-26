//
//  ConfigurableTableViewCell.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

protocol ConfigurableTableViewCell {
    
    /// Configure cell with given item
    ///
    /// - Parameter item: Instance of item.
    func configure(_ item: TableViewCellItem)

}
