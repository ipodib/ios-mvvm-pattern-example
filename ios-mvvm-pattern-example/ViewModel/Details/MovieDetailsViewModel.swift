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
    let isFavorite: Variable<Bool>
    let isDataReady: Driver<Bool>
    private(set) var sectionsData: Driver<[TableViewSection]>
    
    private let favoritesRepository: FavoritesRepository
    private let dataProvider: MoviesDataProvider
    private let movieId: Int
    private var movieDetails: MovieDetails?
    
    init(_ dataProvider: MoviesDataProvider, _ movieId: Int, _ repository: FavoritesRepository) {
        self.dataProvider = dataProvider
        self.movieId = movieId
        self.refresh = Variable(true)
        self.isFavorite = Variable(repository.fetch(by: movieId) != nil)
        self.sectionsData = Driver.empty()
        self.isDataReady = sectionsData.map { _ in true }
        self.favoritesRepository = repository
        self.prepareLoadingData()
    }
    
    func addToFavorites() {
        guard let details = movieDetails else {
            return
        }
        favoritesRepository.add(details)
        isFavorite.value = true
    }
    
    func removeFromFavorites() {
        favoritesRepository.remove(by: movieId)
        isFavorite.value = false
    }
    
    private func prepareLoadingData() {
        let loadingDataDriver = dataProvider
            .loadMovieDetails(with: movieId)
            .do(onNext: movieDetailsLoaded(_:))
            .map { MovieDetailsCellItemConvertor().convert(from: $0) }
            .asDriver(onErrorJustReturn: [])
        
        sectionsData = refresh
            .asDriver()
            .filter { $0 == true }
            .flatMap { _ in loadingDataDriver }
    }
    
    private func movieDetailsLoaded(_ movie: MovieDetails) {
        movieDetails = movie
    }
}
