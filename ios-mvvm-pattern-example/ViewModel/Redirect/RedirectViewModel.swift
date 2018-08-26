//
//  RedirectViewModel.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 26/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RedirectViewModel {
    
    private(set) var dataIsReady: Driver<Bool>!
    
    init(_ dataProvider: ConfigurationDataProvider) {
        dataIsReady = provideLoadingDriver(dataProvider)
    }
    
    private func provideLoadingDriver(_ dataProvider: ConfigurationDataProvider) -> Driver<Bool> {
        return dataProvider.loadConfiguration()
            .do(onNext: configurationLoaded(_:))
            .map { _ in true }
            .asDriver(onErrorJustReturn: false)
            .startWith(false)
    }
    
    private func configurationLoaded(_ config: APIConfiguration) {
        LocalDataStore().save(config)
    }

}
