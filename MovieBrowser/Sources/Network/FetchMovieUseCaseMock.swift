//
//  FetchMovieUseCaseMock.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//

import Combine

struct FetchMovieUseCaseMock: FetchMovieUseCase {
    func fetchMovie(id: String) -> AnyPublisher<MovieDetails, any Error> {
        Just(MovieDetails.makeMovieDetails())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
