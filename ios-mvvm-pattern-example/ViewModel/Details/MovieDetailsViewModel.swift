//
//  MovieDetailsViewModel.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 8/27/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MovieDetailsViewModel {
    
    let results: Driver<[TableViewSection]>
    
    init(_ dataProvider: MoviesDataProvider, _ movieId: Int) {
        results = dataProvider.loadMovieDetails(with: movieId)
            .map { MovieDetailsCellItemConvertor().convert(from: $0) }
            .asDriver(onErrorJustReturn: [])
    }
    
}
