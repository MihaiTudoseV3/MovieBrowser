//
//  HomeViewModel.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var state: HomeViewModelState
    
    init() {
        state = HomeViewModelState.makeHomeViewModelState()
    }
}
