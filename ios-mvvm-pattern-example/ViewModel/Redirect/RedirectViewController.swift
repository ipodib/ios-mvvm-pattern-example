//
//  RedirectViewController.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 26/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit
import RxSwift

class RedirectViewController: UIViewController {

    private var viewModel: RedirectViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RedirectViewModel(ConfigurationDataProvider())
        bind()
    }
    
    private func bind() {
        viewModel.dataIsReady
            .do(onNext: navigateToNextScreen(_:))
            .drive()
            .disposed(by: disposeBag)
    }
    
    private func navigateToNextScreen(_ navigate: Bool) {
        guard navigate else {
            return
        }
        print("navigate to next screen")
    }
}
