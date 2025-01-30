//
//  MovieDetailsViewModelState+Mock.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 30.01.2025.
//

extension MovieDetailsViewModelState {
    static func makeLoadingViewModelState() -> MovieDetailsViewModelState {
        .init(content: .loading)
    }
    
    static func makeLoadedViewModelState() -> MovieDetailsViewModelState {
        .init(content: .loaded(.makeMovieDetails()))
    }
    
    static func makeErrorViewModelState() -> MovieDetailsViewModelState {
        .init(content: .error("Unknown error"))
    }
}
