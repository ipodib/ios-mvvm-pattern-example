//
//  FavoritesRepository.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 26/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import Foundation
import CoreData

class FavoritesRepository {
    
    private let container: CoreDataContainer
    
    init(container: CoreDataContainer) {
        self.container = container
    }
    
    /// Fetch movie details by id.
    ///
    /// - Parameter id: Movie id.
    /// - Returns: Movie details managed object.
    func fetch(by id: Int) -> CRMovieDetails? {
        do {
            let request = CRMovieDetails.fetchRequest(by: id)
            return try container.viewContext.fetch(request).first
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    /// Store movie in favorites.
    ///
    /// - Parameter movie: Movie object.
    func add(_ movie: MovieDetails) {
        let context = container.writeContext
        container.writeContext.perform {
            _ = movie.mapToManagedObject(with: context)
            context.saveOrRollback()
        }
    }
    
}

private extension CRMovieDetails {
    
    class func fetchRequest(by id: Int) -> NSFetchRequest<CRMovieDetails> {
        let request: NSFetchRequest<CRMovieDetails> = CRMovieDetails.fetchRequest()
        request.predicate = NSPredicate(format: "id = %lf", Double(id))
        return request
    }
    
}

