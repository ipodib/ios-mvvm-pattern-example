//
//  MovieDetailsTableViewCell.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 15/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

class GeneralMovieDetailsTableViewCell: UITableViewCell, ConfigurableTableViewCell {
    
    static let cellIdentifier = "GeneralMovieDetailsTableViewCell"
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    override func prepareForReuse() {
        posterImageView.image = nil
    }
    
    func configure(_ item: TableViewCellItem) {
        guard let item = item as? GeneralMovieDetailsViewModel else {
            return
        }
        
        titleLabel.text = item.title
        durationLabel.text = item.duration
        releaseDateLabel.text = item.releaseDate
        languageLabel.text = item.language
        ratingLabel.text = item.rating
        posterImageView.loadPoster(with: item.posterPath)
    }
    
}
