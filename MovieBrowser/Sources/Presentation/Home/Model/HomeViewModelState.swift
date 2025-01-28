//
//  HomeViewModelState.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

struct HomeViewModelState {
    let title: String
    let popularMoviesTitle: String
    let nowShowingMoviesTitle: String
    var popularMovies: [HomeMovie]
    var nowShowingMovies: [HomeMovie]
}
