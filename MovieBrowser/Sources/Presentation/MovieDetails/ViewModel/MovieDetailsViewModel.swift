//
//  MovieDetailsViewModel.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//
import Foundation
import Combine

class MovieDetailsViewModel: ObservableObject {
    @Published var state: MovieDetailsViewModelState
    
    let movieId: String
    let fetchMovieUseCase: FetchMovieUseCase
    var cancellables: Set<AnyCancellable> = []
    
    init(movieId: String, fetchMovieUseCase: FetchMovieUseCase) {
        self.state = MovieDetailsViewModelState(content: .notInitialized)
        self.movieId = movieId
        self.fetchMovieUseCase = fetchMovieUseCase
    }
    
    func fetchMovie() {
        fetchMovie(movieId)
    }
    
    private func fetchMovie(_ movieId: String) {
        state.content = .loading
        fetchMovieUseCase.fetchMovie(id: movieId)
            .sink {[weak self] completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.state.content = .error(error.localizedDescription)
                }
            } receiveValue: {[weak self] value in
                self?.state.content = .loaded(value)
            }.store(in: &cancellables)

    }
}
