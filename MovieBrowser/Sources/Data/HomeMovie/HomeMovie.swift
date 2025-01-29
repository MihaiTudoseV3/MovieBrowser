//
//  Movie.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

struct HomeMovie: Equatable, Hashable {
    var title: String
    var rating: String
    var image: String
    var genre: [String]?
    var duration: String?
}
