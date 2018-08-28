//
//  OverviewMovieDetailsItem.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 16/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class MovieInfoDetailsViewModel: TableViewCellItem {
    
    var info: String?
    
    var cellIdentifier: String {
        return TextContentTableViewCell.cellIdentifier
    }
    
    init(_ info: String?) {
        self.info = info
    }
    
}
