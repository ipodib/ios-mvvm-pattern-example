//
//  URL+ImageLoader.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 14/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation

extension URL {
    
    /// Generate full image url using path and required image quality.
    ///
    /// - Parameters:
    ///   - path: Image path.
    ///   - quality: Image quality.
    /// - Returns: Full image url.
    func appendingPosterPath(_ path: String, quality: ImageQuality) -> URL {
        return appendingPathComponent(quality.rawValue).appendingPathComponent(path)
    }
    
}
