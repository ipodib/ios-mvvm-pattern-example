//
//  MoviesDataProvider.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import RxSwift

class MoviesDataProvider: DataProvider {
    
    /// Load movie details using id.
    ///
    /// - Parameters:
    ///   - id: Movie id.
    ///   - completion: Completion handler.
    func loadMovieDetails(with id: Int) -> Observable<MovieDetails> {
        return execute(request: MoviesRouter.getDetails(id: id))
    }
    
}
