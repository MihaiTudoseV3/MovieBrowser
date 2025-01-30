//
//  MovieDetailsViewModelState.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//

struct MovieDetailsViewModelState {
    var content: Content
}

extension MovieDetailsViewModelState {
    enum Content: Equatable {
        case notInitialized
        case loading
        case loaded(MovieDetails)
        case error(String)
    }
}
