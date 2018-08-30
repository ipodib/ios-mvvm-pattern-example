//
//  FavoriteMovieTableViewCell.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 8/28/18.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class FavoriteMovieTableViewCell: UITableViewCell, ConfigurableTableViewCell {

    static let cellIdentifier = "FavoriteMovieTableViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    
    func configure(_ item: TableViewCellItem) {
        guard let item = item as? FavoritesItemViewModel else {
            return
        }
        
        titleLabel.text = item.title
        posterImageView.loadPoster(with: item.posterPath)
    }
    
    override func prepareForReuse() {
        posterImageView.image = nil
    }
    
}
