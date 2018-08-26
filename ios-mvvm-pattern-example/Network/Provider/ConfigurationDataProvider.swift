//
//  ConfigurationDataProvider.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 14/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import RxSwift

class ConfigurationDataProvider: DataProvider {
    
    /// Load system wide configuration.
    ///
    /// - Parameter completion: Completion handler.
    func loadConfiguration() -> Observable<APIConfiguration> {
        return execute(request: ConfigurationRouter.loadConfiguration)
    }
    
}
