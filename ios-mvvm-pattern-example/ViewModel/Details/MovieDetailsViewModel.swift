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

class MovieDetailsViewModel: ViewModelType {

    struct Input {
        let load: Driver<Void>
        let refresh: Driver<Void>
        let addTofavorites: Driver<Void>
        let removeFromFavorites: Driver<Void>
    }
    
    struct Output {
        let isFavorite: Variable<Bool>
        let results: Driver<[TableViewSection]>
        let dataIsReady: Driver<Bool>
        let addedToFavorites: Driver<Void>
        let removeFromFavorites: Driver<Void>
    }
    
    private let movieId: Int
    private let dataProvider: MoviesDataProvider
    private let favoritesRepository: FavoritesRepository
    private let isFavorite: Variable<Bool>
    private var movieDetails: MovieDetails?
    
    init(_ dataProvider: MoviesDataProvider, _ movieId: Int, _ repository: FavoritesRepository) {
        self.dataProvider = dataProvider
        self.movieId = movieId
        self.favoritesRepository = repository
        self.isFavorite = Variable(repository.fetch(by: movieId) != nil)
    }
    
    func transform(input: Input) -> Output {
        let loader = input.load.flatMapLatest(movieDetailsDriver)
        let refresh = input.refresh.flatMapLatest(movieDetailsDriver)
        let data = Driver.merge([loader, refresh])
        
        let addedToFavorites = input.addTofavorites.do(onNext: addToFavorites)
        let removedFromFavorites = input.removeFromFavorites.do(onNext: removeFromFavorites)
        
        let dataIsReady = data.map { _ in true }
        
        return Output(isFavorite: isFavorite,
                      results: data,
                      dataIsReady: dataIsReady,
                      addedToFavorites: addedToFavorites,
                      removeFromFavorites: removedFromFavorites)
    }
    
    private func addToFavorites() {
        guard let details = movieDetails else {
            return
        }
        favoritesRepository.add(details)
        isFavorite.value = true
    }
    
    private func removeFromFavorites() {
        favoritesRepository.remove(by: movieId)
        isFavorite.value = false
    }
    
    private func movieDetailsDriver() -> Driver<[TableViewSection]> {
        return dataProvider.loadMovieDetails(with: movieId)
            .do(onNext: movieDetailsLoaded(_:))
            .map { MovieDetailsCellItemConvertor().convert(from: $0) }
            .asDriver(onErrorJustReturn: [])
    }
    
    private func movieDetailsLoaded(_ movie: MovieDetails) {
        movieDetails = movie
    }
}
