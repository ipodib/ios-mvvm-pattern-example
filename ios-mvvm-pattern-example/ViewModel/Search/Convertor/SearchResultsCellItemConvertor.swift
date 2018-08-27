//
//  SearchResultsCellItemConvertor.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 17/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class SearchResultsCellItemConvertor: TableViewCellItemConverter {
    
    func convert(from data: [Movie]) -> [SearchResultViewModel] {
        return data.compactMap { SearchResultViewModel($0) }
    }
    
}
