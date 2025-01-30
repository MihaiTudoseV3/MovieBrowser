//
//  FetchMovieUseCaseMock.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//

import Combine
import Foundation

struct FetchMovieUseCaseMock: FetchMovieUseCase {
    var result: NetworkResponseState
    
    init(result: NetworkResponseState = .never) {
        self.result = result
    }
    
    func fetchMovie(id: String) -> AnyPublisher<MovieDetails, any Error> {
        switch result {
        case .delayed(seconds: let seconds):
            fetchMovieDelayed(seconds: seconds)
        case .success(let movie):
            fetchMovieSuccessful(movie: movie)
        case .failure(error: let error):
            fetchMovieFailing(error: error)
        case .never:
            Empty<MovieDetails, any Error>()
                        .eraseToAnyPublisher()
        }
    }
    
    private func fetchMovieDelayed(seconds: Double) -> AnyPublisher<MovieDetails, any Error> {
        Just(MovieDetails.makeMovieDetails())
            .setFailureType(to: Error.self)
            .delay(for: .seconds(seconds), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func fetchMovieFailing(error: FetchError) -> AnyPublisher<MovieDetails, any Error> {
        Fail(error: error)
            .delay(for: .seconds(0.1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func fetchMovieSuccessful(movie: MovieDetails) -> AnyPublisher<MovieDetails, any Error> {
        Just(movie)
            .setFailureType(to: Error.self)
            .delay(for: .seconds(0.1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    enum NetworkResponseState {
        case delayed(seconds: Double)
        case success(movie: MovieDetails)
        case failure(error: FetchError)
        case never
    }
    
    enum FetchError: Error {
        case notFound
        case networkError
    }
}
