//
//  SearchTableViewController.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 27/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchTableViewController: UITableViewController {

    var injector = Injector()
    
    @IBOutlet private weak var searchTitleLabel: UILabel!
    
    private var viewModel: SearchViewModel!
    private let searchController = UISearchController(searchResultsController: nil)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = nil
        tableView.dataSource = nil
        
        configureSearchController()
        viewModel = SearchViewModel(injector.providerSearchDataProvider())
        bind()
    }
    
    // MARK: - Private
    
    private func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Localization.Search.search
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
}

extension SearchTableViewController: Bindable {
    
    func bind() {
        let input = SearchViewModel.Input(query: searchController.searchBar.rx.text)
        let output = viewModel.transform(input: input)
        
        output.results
            .drive(tableView.rx
                .items(cellIdentifier: SearchResultTableViewCell.cellIdentifier,
                       cellType: SearchResultTableViewCell.self)) { (row, element, cell) in
                        cell.configure(element)
            }
            .disposed(by: disposeBag)
        
        output.foundMovies
            .drive(searchTitleLabel.rx.text)
            .disposed(by: disposeBag)
        
        // bind selection
        tableView.rx.modelSelected(SearchResultViewModel.self)
            .subscribe(onNext: navigateToDetailsScreen(_:))
            .disposed(by: disposeBag)
    }

}

// MARK: - Navigation
private extension SearchTableViewController {
    
    func navigateToDetailsScreen(_ item: SearchResultViewModel) {
        guard let viewController = MovieDetailsTableViewController.instantiateFromStoryboard() else {
            return
        }
        
        viewController.movieId = item.id
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
