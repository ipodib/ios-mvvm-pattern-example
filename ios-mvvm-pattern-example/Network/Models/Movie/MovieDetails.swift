//
//  MovieDetails.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class MovieDetails: Mappable {
    
    var id: Int!
    var adult: Bool?
    var backdropPath: String?
    var belongsToCollection: MovieCollection?
    var budget: Int?
    var genres: [GenreDetails]?
    var homepage: String?
    var imdbId: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [ProductionCompany]?
    var productionCountries: [ProductionCountry]?
    var releaseDate: String?
    var revenue: Double?
    var runtime: Int?
    var spokenLanguages: [SpokenLanguage]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        belongsToCollection <- map["belongs_to_collection"]
        budget <- map["budget"]
        genres <- map["genres"]
        homepage <- map["homepage"]
        imdbId <- map["imdb_id"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        productionCompanies <- map["production_companies"]
        productionCountries <- map["production_countries"]
        releaseDate <- map["release_date"]
        revenue <- map["revenue"]
        runtime <- map["runtime"]
        spokenLanguages <- map["spoken_languages"]
        status <- map["status"]
        tagline <- map["tagline"]
        video <- map["video"]
        title <- map["title"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
    }
    
}

extension MovieDetails: CoreDataMapping {
    
    func mapToManagedObject(with context: NSManagedObjectContext) -> CRMovieDetails {
        let object: CRMovieDetails = context.insertObject()
        object.id = Double(id)
        object.belongsToCollection = belongsToCollection?.mapToManagedObject(with: context)
        object.budget = Double(budget ?? 0)
        object.homepage = homepage
        object.imdbId = Double(imdbId ?? 0)
        object.originalLanguage = originalLanguage
        object.originalTitle = originalTitle
        object.overview = overview
        object.popularity = Double(popularity ?? 0)
        object.posterPath = posterPath
        object.releaseDete = releaseDate
        object.revenue = Double(revenue ?? 0)
        object.runtime = Double(runtime ?? 0)
        object.status = status
        object.tagline = tagline
        object.title = title
        object.video = video ?? false
        object.voteAverage = voteAverage ?? 0
        object.voteCount = Double(voteCount ?? 0)
        
        genres?.forEach { object.addToGenres($0.mapToManagedObject(with: context)) }
        productionCompanies?.forEach { object.addToProductionCompanies($0.mapToManagedObject(with: context)) }
        productionCountries?.forEach { object.addToProductionCountries($0.mapToManagedObject(with: context)) }
        spokenLanguages?.forEach { object.addToSpokenLanguages($0.mapToManagedObject(with: context)) }
        
        return object
    }
    
}
