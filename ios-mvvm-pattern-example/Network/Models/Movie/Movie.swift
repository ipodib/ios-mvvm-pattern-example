//
//  Movie.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 11/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {
    
    var id: Int?
    var posterPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: String?
    var genreIds: [Int]?
    var originalTitle: String?
    var originalLanguage: String?
    var title: String?
    var backdropPath: String?
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        posterPath <- map["poster_path"]
        adult <- map["adult"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
        genreIds <- map["genre_ids"]
        originalTitle <- map["original_title"]
        originalLanguage <- map["original_language"]
        title <- map["title"]
        backdropPath <- map["backdrop_path"]
        popularity <- map["popularity"]
        voteCount <- map["vote_count"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
    }
    
}
