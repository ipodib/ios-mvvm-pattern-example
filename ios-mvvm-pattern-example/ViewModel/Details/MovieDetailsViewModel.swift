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
    
    let refresh: Variable<Bool>
    let isDataReady: Driver<Bool>
    let isLoading: Driver<Bool>
    let sectionsData: Driver<[TableViewSection]>
    
    init(_ dataProvider: MoviesDataProvider, _ movieId: Int) {
        refresh = Variable(true)
        sectionsData = refresh
            .asDriver()
            .filter { $0 == true }
            .flatMap { _ in
                dataProvider.loadMovieDetails(with: movieId)
                    .map { MovieDetailsCellItemConvertor().convert(from: $0) }
                    .asDriver(onErrorJustReturn: [])
            }
        isDataReady = sectionsData.map { _ in true }
        isLoading = sectionsData.map { _ in false }.startWith(true)
    }
    
}
