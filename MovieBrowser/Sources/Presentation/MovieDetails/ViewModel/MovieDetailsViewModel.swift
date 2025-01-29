//
//  MovieDetailsViewModel.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//
import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var state: MovieDetailsViewModelState
    
    init(movie: HomeMovie) {
        self.state = MovieDetailsViewModelState(content: .notInitialized, title: movie.title)
        fetchMovie()
    }
    
    private func fetchMovie() {
        state.content = .loading
    }
}
