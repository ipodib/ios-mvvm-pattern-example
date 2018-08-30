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

class RedirectViewModel: ViewModelType {
    
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        let dataIsReady: Driver<Bool>
    }
    
    private let dataProvider: ConfigurationDataProvider
    
    init(_ dataProvider: ConfigurationDataProvider) {
        self.dataProvider = dataProvider
    }
    
    func transform(input: Input) -> Output {
        let loader = dataProvider.loadConfiguration()
            .do(onNext: configurationLoaded(_:))
            .map { _ in true }
            .asDriver(onErrorJustReturn: false)
            .startWith(false)
        return Output(dataIsReady: input.load.flatMapLatest { loader })
    }
    
    private func configurationLoaded(_ config: APIConfiguration) {
        LocalDataStore().save(config)
    }

}
