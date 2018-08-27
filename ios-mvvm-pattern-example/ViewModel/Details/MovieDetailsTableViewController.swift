//
//  MovieDetailsTableViewController.swift
//  ios-mvvm-pattern-example
//
//  Created by Ivan Podibka on 8/27/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class MovieDetailsTableViewController: UITableViewController {

    var movieId: Int!
    
    private var viewModel: MovieDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = nil
        tableView.dataSource = nil
        
        viewModel = MovieDetailsViewModel(MoviesDataProvider(), movieId)
        bind()
    }

}

extension MovieDetailsTableViewController: Bindable {
    
    func bind() {
//        viewModel.results.asObservable().bind(to: tableView.rx.items)
    }
    
}
