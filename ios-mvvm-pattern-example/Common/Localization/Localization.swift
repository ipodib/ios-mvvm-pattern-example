//
//  Localization.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 16/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

struct Localization {
    
    struct Search {
        static let search = NSLocalizedString("search", comment: "")
        static let unableToExecuteQuery = NSLocalizedString("unable_to_execute_query", comment: "")
        static let foundMoviesCountFormat = NSLocalizedString("found_movies", comment: "")
    }
    
    struct MovieDetails {
        static let general = NSLocalizedString("general_title", comment: "")
        static let overview = NSLocalizedString("overview_title", comment: "")
        static let genres = NSLocalizedString("genres_title", comment: "")
        static let spokenLanguages = NSLocalizedString("spoken_languages_title", comment: "")
        static let productionCompanies = NSLocalizedString("production_companies", comment: "")
        static let minutes = NSLocalizedString("minutes", comment: "")
    }
    
}
