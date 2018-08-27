//
//  SearchViewModel.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 27/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {

    let searchQuery = Variable<String?>("")
    let results: Driver<[SearchResultViewModel]>
    let foundMovies: Driver<String>
    
    init(_ dataProvider: SearchDataProvider) {
        results = searchQuery
            .asDriver()
            .flatMap { query -> Driver<[SearchResultViewModel]> in
                guard let query = query, !query.isEmpty else {
                    return Driver.just([])
                }
                return dataProvider.search(query)
                    .map { $0.results }
                    .map { SearchResultsCellItemConvertor().convert(from: $0) }
                    .asDriver(onErrorJustReturn: [])
            }
        foundMovies = results.map {
            String(format: Localization.Search.foundMoviesCountFormat, "\($0.count)")
        }
    }
    
}
