//
//  SearchResultViewModel.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 27/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class SearchResultViewModel: TableViewCellItem {
    
    var id: Int?
    var posterPath: String?
    var title: String?
    var overview: String?
    
    var cellIdentifier: String {
        return SearchResultTableViewCell.cellIdentifier
    }
    
    init(_ movie: Movie) {
        id = movie.id
        posterPath = movie.posterPath
        title = movie.title
        overview = movie.overview
    }
    
}
