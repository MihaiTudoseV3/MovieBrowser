//
//  HomeViewModel.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var state: HomeViewModelState
    
    init(_ viewModelState: HomeViewModelState) {
        state = viewModelState
    }
}
