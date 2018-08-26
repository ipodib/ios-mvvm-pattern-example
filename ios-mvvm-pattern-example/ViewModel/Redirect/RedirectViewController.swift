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

    let dataProvider = ConfigurationDataProvider()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataProvider.loadConfiguration()
            .subscribe(onNext: configurationLoaded(_:),
                       onError:configurationLoadError(_:))
            .disposed(by: disposeBag)
    }
    
    private func configurationLoaded(_ configuration: APIConfiguration) {
        print(String(describing: configuration.toJSON()))
    }
    
    private func configurationLoadError(_ error: Error) {
        print(error.localizedDescription)
    }
}
