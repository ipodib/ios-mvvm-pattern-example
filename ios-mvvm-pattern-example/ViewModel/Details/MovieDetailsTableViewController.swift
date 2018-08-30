//
//  MovieDetailsTableViewController.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 8/27/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class MovieDetailsTableViewController: UITableViewController {

    var movieId: Int!
    var injector = Injector()
    
    @IBOutlet private weak var addToFavoritesButton: UIBarButtonItem!
    @IBOutlet private weak var removeFromFavoritesButton: UIBarButtonItem!
    
    private let refresher = UIRefreshControl()
    private let disposeBag = DisposeBag()
    private var viewModel: MovieDetailsViewModel!
    
    class func instantiateFromStoryboard() -> MovieDetailsTableViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MovieDetailsTableViewController") as? MovieDetailsTableViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        tableView.delegate = nil
        tableView.dataSource = nil
        
        viewModel = MovieDetailsViewModel(MoviesDataProvider(), movieId, injector.provideFavoritesRepository())
        bind()
    }

    private func configureView() {
        refreshControl = refresher
    }
}

extension MovieDetailsTableViewController: Bindable {
    
    func bind() {
        // bind result to table view
        viewModel.sectionsData
            .asObservable()
            .bind(to: tableView.rx.items(dataSource: tableDataSource()))
            .disposed(by: disposeBag)
        
        // stop or start refreshing bind
        viewModel.isDataReady
            .asObservable()
            .map { !$0 }
            .bind(to: self.refresher.rx.isRefreshing)
            .disposed(by: disposeBag)
        
        // start refreshing bind
        refreshControl?.rx
            .controlEvent(.valueChanged)
            .map { _ in self.refresher.isRefreshing }
            .bind(to: viewModel.refresh)
            .disposed(by: disposeBag)
        
        // buttons binding
        addToFavoritesButton.rx.tap
            .do(onNext:{[weak self] _ in
                self?.viewModel.addToFavorites()}
            )
            .subscribe()
            .disposed(by: disposeBag)
        
        removeFromFavoritesButton.rx.tap
            .do(onNext:{[weak self] _ in
                self?.viewModel.removeFromFavorites()}
            )
            .subscribe()
            .disposed(by: disposeBag)
        
        viewModel.isFavorite
            .asDriver()
            .do(onNext: {[weak self] favorite in
                self?.navigationItem.rightBarButtonItem = favorite ?
                    self?.removeFromFavoritesButton :
                    self?.addToFavoritesButton
            })
            .drive()
            .disposed(by: disposeBag)
        
    }
    
}

// MARK: - RxTableViewSectionedReloadDataSource
private extension MovieDetailsTableViewController {
    
    func tableDataSource() -> RxTableViewSectionedReloadDataSource<TableViewSection> {
        return RxTableViewSectionedReloadDataSource<TableViewSection>(
            configureCell: configureCell,
            titleForHeaderInSection: configureHeader)
    }
    
    func configureCell(_ dataSource: TableViewSectionedDataSource<TableViewSection>,
                       _ tableView: UITableView,
                       _ indexPath: IndexPath,
                       _ cellItem: TableViewCellItem) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellItem.cellIdentifier, for: indexPath)
        if let cell = cell as? ConfigurableTableViewCell {
            cell.configure(cellItem)
        }
        return cell
    }
    
    func configureHeader(_ dataSource: TableViewSectionedDataSource<TableViewSection>, _ index: Int) -> String? {
        return dataSource[index].name
    }

}
