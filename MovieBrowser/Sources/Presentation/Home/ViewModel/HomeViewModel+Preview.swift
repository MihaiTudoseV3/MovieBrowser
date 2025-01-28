//
//  HomeViewModel+Preview.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

extension HomeViewModel {
    static func makeViewModel() -> HomeViewModel {
        .init(HomeViewModelState.makeHomeViewModelState())
    }
}
