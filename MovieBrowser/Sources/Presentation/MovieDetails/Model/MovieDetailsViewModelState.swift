//
//  MovieDetailsViewModelState.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//

struct MovieDetailsViewModelState {
    var content: Content
    let title: String
}

extension MovieDetailsViewModelState {
    enum Content {
        case notInitialized
        case loading
        case loaded(MovieDetails)
        case error(String)
    }
}
