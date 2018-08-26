//
//  LocalDataStore.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 14/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

class LocalDataStore {
    
    private struct Keys {
        static let ApiConfig = "apiConfig"
    }
    
    var apiConfig: APIConfiguration? {
        guard let data = UserDefaults.standard.dictionary(forKey: Keys.ApiConfig) else {
            return nil
        }
        return APIConfiguration(JSON: data)
    }
    
    func save(_ config: APIConfiguration) {
        UserDefaults.standard.set(config.toJSON(), forKey: Keys.ApiConfig)
    }
    
}
