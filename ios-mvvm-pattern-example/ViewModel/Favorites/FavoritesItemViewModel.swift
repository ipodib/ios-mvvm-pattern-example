//
//  FavoritesItemViewModel.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 8/30/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class FavoritesItemViewModel: TableViewCellItem {
    
    var cellIdentifier: String {
        return FavoriteMovieTableViewCell.cellIdentifier
    }
 
    let id: Int
    var title: String?
    var posterPath: String?
    
    init(_ movie: MovieDetails) {
        id = movie.id
        title = movie.title
        posterPath = movie.posterPath
    }
    
}
