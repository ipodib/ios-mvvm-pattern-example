//
//  Injector.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 8/17/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class Injector {
    
    func provideLocalDataStore() -> LocalDataStore {
        return LocalDataStore()
    }
    
    func provideConfigurationDataProvider() -> ConfigurationDataProvider {
        return ConfigurationDataProvider()
    }
    
    func providerSearchDataProvider() -> SearchDataProvider {
        return SearchDataProvider()
    }
    
    func provideFavoritesRepository() -> FavoritesRepository {
        return FavoritesRepository(container: CoreDataContainer.default)
    }
    
}
