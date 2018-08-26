//
//  UIImageView+ImageLoader.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 16/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    /// Load image with using poster path and specified quality.
    ///
    /// - Parameters:
    ///   - path: Poster path.
    ///   - quality: Image quality.
    func loadPoster(with path: String?, quality: ImageQuality = .medium) {
        let dataStore = LocalDataStore()
        if let url = dataStore.apiConfig?.images?.secureBaseUrl, let path = path {
            kf.setImage(with: url.appendingPosterPath(path, quality: quality))
        }
    }
    
}
