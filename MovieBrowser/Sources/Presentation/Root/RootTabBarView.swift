//
//  RootTabBarView.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

import SwiftUI

struct RootTabBarView: View {
    var body: some View {
        TabView {
            HomeScreenView(viewModel: HomeViewModel.makeViewModel())
                .tabItem {
                    Image(systemName: "popcorn.circle")
                }
            
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "ticket")
                }
            
            Text("Third Tab")
                .tabItem {
                    Image(systemName: "bookmark")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabBarView()
    }
}

