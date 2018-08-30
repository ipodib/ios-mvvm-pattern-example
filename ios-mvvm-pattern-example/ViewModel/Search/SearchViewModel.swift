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

class SearchViewModel: ViewModelType {

    struct Input {
        let query: ControlProperty<String?>
    }
    
    struct Output {
        let results: Driver<[SearchResultViewModel]>
        let foundMovies: Driver<String>
    }
    
    
    private let dataProvider: SearchDataProvider
    
    init(_ dataProvider: SearchDataProvider) {
        self.dataProvider = dataProvider
        /*
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
         
        }
 */
    }
    
    func transform(input: Input) -> Output {
        let results = searchResultsDriver(for: input.query)
        let foundMovies = results.map {
            String(format: Localization.Search.foundMoviesCountFormat, "\($0.count)")
        }
        
        return Output(results: results, foundMovies: foundMovies)
    }

    private func searchResultsDriver(for query: ControlProperty<String?>) -> Driver<[SearchResultViewModel]> {
        let provider = dataProvider
        return query
            .asDriver()
            .flatMap { query -> Driver<[SearchResultViewModel]> in
                guard let query = query, !query.isEmpty else {
                    return Driver.just([])
                }
                return provider.search(query)
                    .map { $0.results }
                    .map { SearchResultsCellItemConvertor().convert(from: $0) }
                    .asDriver(onErrorJustReturn: [])
        }
    }
    
}
