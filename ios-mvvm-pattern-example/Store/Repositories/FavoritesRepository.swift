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
    
    /// Fetch all stored movies.
    ///
    /// - Returns: List of models.
    func fetchAll() -> [MovieDetails] {
        do {
            return try container.viewContext
                .fetch(CRMovieDetails.fetchRequest())
                .compactMap { $0.asMappable() }
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    /// Fetch movie details by id.
    ///
    /// - Parameter id: Movie id.
    /// - Returns: Movie details managed object.
    func fetch(by id: Int) -> MovieDetails? {
        return fetch(by: id, with: container.viewContext).map { $0.asMappable() }
    }
    
    /// Store movie in favorites.
    ///
    /// - Parameter movie: Movie object.
    func add(_ movie: MovieDetails) {
        let context = container.writeContext
        container.writeContext.perform {
            _ = movie.asManagedObject(with: context)
            context.saveOrRollback()
        }
    }
    
    /// Remove movie from favorites
    ///
    /// - Parameter id: Movie id.
    func remove(by id: Int) {
        let context = container.writeContext
        context.perform { [weak self] in
            guard let object = self?.fetch(by: id, with: context) else {
                return
            }
            context.delete(object)
            context.saveOrRollback()
        }
    }
    
    private func fetch(by id: Int, with context: NSManagedObjectContext) -> CRMovieDetails? {
        do {
            let request = CRMovieDetails.fetchRequest(by: id)
            return try context.fetch(request).first
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

private extension CRMovieDetails {
    
    class func fetchRequest(by id: Int) -> NSFetchRequest<CRMovieDetails> {
        let request: NSFetchRequest<CRMovieDetails> = CRMovieDetails.fetchRequest()
        request.predicate = NSPredicate(format: "id = %lf", Double(id))
        return request
    }
    
}

