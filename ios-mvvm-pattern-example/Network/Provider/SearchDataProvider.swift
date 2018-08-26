//
//  SearchDataProvider.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 11/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import RxSwift

class SearchDataProvider: DataProvider {
    
    /// Search movies using given query
    ///
    /// - Parameters:
    ///   - query: Query string.
    ///   - completion: Completion handler.
    func search(_ query: String) -> Observable<SearchResult> {
        return execute(request: SearchRouter.search(query: query))
    }
    
}
