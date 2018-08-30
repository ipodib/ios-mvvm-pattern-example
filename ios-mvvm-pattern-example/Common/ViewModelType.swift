//
//  ViewModelType.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 8/30/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
