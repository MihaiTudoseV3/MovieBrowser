//
//  RouterViewModifier.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//
import Foundation
import SwiftUI

struct RouterViewModifier: ViewModifier {
    
    @State private var router = Router ()
    
    private func destinationView(for destination: Destination) -> some View {
        Group {
            switch destination {
            case .home:
                HomeScreenView(viewModel: HomeViewModel())
            case .details(let movie):
                Text("Details for \(movie.title)")
            }
        }
        .environment(router)
    }
    func body (content: Content) -> some View {
        NavigationStack(path: $router.path) {
            content
                .environment(router)
                .navigationDestination(for: Destination.self) { destination in destinationView (for: destination)
                }
        }
    }
}
