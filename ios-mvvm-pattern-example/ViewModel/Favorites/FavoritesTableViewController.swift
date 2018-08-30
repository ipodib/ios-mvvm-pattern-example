//
//  FavoritesTableViewController.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 8/30/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FavoritesTableViewController: UITableViewController {

    var injector = Injector()
    
    private let disposeBag = DisposeBag()
    private var viewModel: FavoritesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = nil
        tableView.delegate = nil
        
        viewModel = FavoritesViewModel(injector.provideFavoritesRepository())
        bind()
    }

}

extension FavoritesTableViewController: Bindable {
    
    func bind() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .map { _ in ()}
            .asDriver(onErrorJustReturn: ())
        let output = viewModel.transform(input: FavoritesViewModel.Input(load: viewWillAppear))
        
        output.results
            .drive(tableView.rx.items(cellIdentifier: FavoriteMovieTableViewCell.cellIdentifier,
                                      cellType: FavoriteMovieTableViewCell.self)) { (row, element, cell) in
                                        cell.configure(element)
            }
            .disposed(by: disposeBag)
        
        // selection bind
        tableView.rx.modelSelected(FavoritesItemViewModel.self)
            .subscribe(onNext: navigateToDetailsScreen(_:))
            .disposed(by: disposeBag)
    }
    
}

// MARK: - Navigation
private extension FavoritesTableViewController {
    
    func navigateToDetailsScreen(_ item: FavoritesItemViewModel) {
        guard let viewController = MovieDetailsTableViewController.instantiateFromStoryboard() else {
            return
        }
        
        viewController.movieId = item.id
        navigationController?.pushViewController(viewController, animated: true)
    }
}
