//
//  HomeScreen.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

import SwiftUI

struct HomeScreenView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            buildNavigationBar(state: viewModel.state)
            .padding()
            buildNowShowingSection(state: viewModel.state)
            buildPopularSection(state: viewModel.state)
            Spacer()
        }
        .background(Color(.systemGray6))
    }
    
    @ViewBuilder
    private func buildNavigationBar(state: HomeViewModelState) -> some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Text(state.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {}) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .padding(4)
                }
            }
        }
    }
    
    @ViewBuilder
    private func buildNowShowingSection(state: HomeViewModelState) -> some View {
        VStack(alignment: .leading) {
            Text(state.nowShowingMoviesTitle)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.leading)
            
            GeometryReader { geometry in
                let itemWidth = geometry.size.width / 2.5
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(state.nowShowingMovies, id: \.title) { movie in
                            buildNowShowingItem(movie)
                                .frame(width: itemWidth)
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
    
    @ViewBuilder
    private func buildNowShowingItem(_ movie: HomeMovie) -> some View {
        VStack {
            Image(movie.image)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 150)
                .cornerRadius(10)
            
            Text(movie.title)
                .font(.caption)
                .foregroundColor(.primary)
            
            Text(movie.rating)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.leading, 10)
    }
    
    @ViewBuilder
    private func buildPopularSection(state: HomeViewModelState) -> some View {
        VStack(alignment: .leading) {
            Text(state.popularMoviesTitle)
                .font(.headline)
                .padding(.leading)
            
            List(state.popularMovies, id: \.title) { movie in
                buildPopularSectionItem(movie)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
            }
            .listStyle(.plain)
        }
    }
    
    private func buildPopularSectionItem(_ movie: HomeMovie) -> some View {
        HStack {
            Image(movie.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 120)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(movie.rating)
                    .font(.caption)
                    .foregroundColor(.gray)
                let genre = movie.genre?.joined(separator: " ")
                Text(genre ?? "")
                    .font(.caption)
                    .foregroundColor(.blue)
                Text(movie.duration ?? "")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(viewModel: HomeViewModel.makeViewModel())
    }
}
