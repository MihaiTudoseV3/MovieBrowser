//
//  HomeViewModelState+Mock.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

extension HomeViewModelState {
    static func makeHomeViewModelState() -> Self {
        HomeViewModelState(title: "FilmKu",
                           popularMoviesTitle: "Popular",
                           nowShowingMoviesTitle: "Now Showing",
                           popularMovies: HomeMovie.makePopularMovies(),
                           nowShowingMovies: HomeMovie.makeNowShowingMovies())
    }
}
