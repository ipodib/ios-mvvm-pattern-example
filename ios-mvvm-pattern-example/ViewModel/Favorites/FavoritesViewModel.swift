//
//  FavoritesViewModel.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 8/30/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class FavoritesViewModel: ViewModelType {
    
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        let results: Driver<[FavoritesItemViewModel]>
    }
    
    private let repository: FavoritesRepository
    
    init(_ repository: FavoritesRepository) {
        self.repository = repository
    }
    
    func transform(input: Input) -> Output {
        let results = input.load
            .map { self.repository.fetchAll() }
            .map { FavoriteMoviesConvertor().convert(from: $0) }
        return Output(results: results)
    }
    
}
