//
//  FavoriteMoviesConvertor.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 8/28/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class FavoriteMoviesConvertor: TableViewCellItemConverter {
    
    func convert(from data: [MovieDetails]) -> [FavoritesItemViewModel] {
        return data.compactMap { FavoritesItemViewModel($0) }
    }
    
}
