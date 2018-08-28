
//
//  TextContentTableViewCell.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 16/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class TextContentTableViewCell: UITableViewCell, ConfigurableTableViewCell {
    
    static let cellIdentifier = "TextContentTableViewCell"

    func configure(_ item: TableViewCellItem) {
        guard let item = item as? MovieInfoDetailsViewModel else {
            return
        }
        textLabel?.text = item.info
    }
    
}
