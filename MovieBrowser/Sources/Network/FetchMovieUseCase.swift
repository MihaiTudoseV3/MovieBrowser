//
//  FetchMovieUseCase.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//
import Combine

protocol FetchMovieUseCase {
    func fetchMovie(id: String) -> AnyPublisher<MovieDetails, Error>
}
