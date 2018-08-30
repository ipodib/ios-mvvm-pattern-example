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

    var injector = Injector()
    
    private var viewModel: RedirectViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RedirectViewModel(injector.provideConfigurationDataProvider())
        bind()
    }
    
    private func navigateToNextScreen(_ navigate: Bool) {
        guard navigate else {
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let window = UIApplication.shared.defaultAppDelegate().window
        window?.rootViewController = storyboard.instantiateInitialViewController()
    }
}

extension RedirectViewController: Bindable {
    
    func bind() {
        viewModel.dataIsReady
            .do(onNext: navigateToNextScreen(_:))
            .drive()
            .disposed(by: disposeBag)
    }
    
}
