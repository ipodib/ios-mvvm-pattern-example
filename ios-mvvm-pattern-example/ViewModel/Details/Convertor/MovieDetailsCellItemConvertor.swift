//
//  MovieDetailsItemGenerator.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 16/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class MovieDetailsCellItemConvertor: TableViewCellItemConverter {
    
    func convert(from data: MovieDetails) -> [TableViewSection] {
        var sections = [TableViewSection]()
        
        sections.append(contentsOf: createGeneralSections(data))
        sections.append(contentsOf: createOverviewSections(data))
        sections.append(contentsOf: createGenresSections(data))
        sections.append(contentsOf: createSpokenLanguagesSections(data))
        sections.append(contentsOf: createProductionCompanies(data))
        
        return sections
    }
    
    private func createGeneralSections(_ data: MovieDetails) -> [TableViewSection] {
        return [TableViewSection(Localization.MovieDetails.general, [GeneralMovieDetailsViewModel(data)])]
    }
    
    private func createOverviewSections(_ data: MovieDetails) -> [TableViewSection] {
        guard let overview = data.overview else {
            return []
        }
        return [TableViewSection(Localization.MovieDetails.overview, [MovieInfoDetailsViewModel(overview)])]
    }
    
    private func createGenresSections(_ data: MovieDetails) -> [TableViewSection] {
        guard let genres = data.genres, !genres.isEmpty else {
            return []
        }
        
        let genresString = genres.compactMap { $0.name }.joined(separator: ", ")
        
        return [TableViewSection(Localization.MovieDetails.genres, [MovieInfoDetailsViewModel(genresString)])]
    }
    
    private func createSpokenLanguagesSections(_ data: MovieDetails) -> [TableViewSection] {
        guard let languages = data.spokenLanguages, !languages.isEmpty else {
            return []
        }
        
        let items = languages.compactMap { MovieInfoDetailsViewModel($0.name) }
        
        return [TableViewSection(Localization.MovieDetails.spokenLanguages, items)]
    }
    
    private func createProductionCompanies(_ data: MovieDetails) -> [TableViewSection] {
        guard let companies = data.productionCompanies, !companies.isEmpty else {
            return []
        }
        
        let items = companies.compactMap { MovieInfoDetailsViewModel($0.name) }
        
        return [TableViewSection(Localization.MovieDetails.productionCompanies, items)]
    }
    
}
