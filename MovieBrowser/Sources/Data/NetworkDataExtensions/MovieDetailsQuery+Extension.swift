//
//  MovieDetailsQuery+Extension.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 30.01.2025.
//

import IMDbAPI
import Foundation

extension MovieDetailsQuery.Data.Title {
    func mapToMovieDetails() -> MovieDetails {
        let imdbRating = String(format: "%.1f/10 IMDb", rating?.aggregate_rating ?? 10.0)
        let minutes = runtime_minutes ?? 0
        let duration = "\(minutes/60)h \(minutes%60)min"
        
        return .init(id: id,
                     title: primary_title,
                     imdbRating: imdbRating,
                     duration: duration,
                     genres: genres ?? [],
                     plot: plot,
                     coverImageUrl: posters?.first?.url,
                     certificateRating: certificates?.first?.rating,
                     language: spoken_languages?.first?.name,
                     cast: casts?.compactMap({ $0.mapToCast() }) ?? []
        )
    }
}

fileprivate extension MovieDetailsQuery.Data.Title.Cast {
    func mapToCast() -> MovieDetails.Cast? {
        guard let name else { return nil }
        return .init(name: name.display_name,
                     imageUrl: name.avatars?.first?.url)
    }
}
