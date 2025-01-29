//
//  HomeScreen.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

import SwiftUI

struct HomeScreenView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(Router.self) var router
    
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
    
    private func buildNowShowingSection(state: HomeViewModelState) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(state.nowShowingMoviesTitle)
                    .font(.headline)
                
                Spacer()
                
                buildSectionButton(title: "See more") {
                    print("open a list of movies?")
                }
            }
            .padding(.horizontal)
            
            GeometryReader { geometry in
                let itemWidth = geometry.size.width / 2.5
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(state.nowShowingMovies, id: \.title) { movie in
                            buildNowShowingItem(movie)
                                .frame(width: itemWidth)
                                .onTapGesture {
                                    router.navigateTo(.details(movie))
                                }
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
    
    private func buildNowShowingItem(_ movie: HomeMovie) -> some View {
        VStack(alignment: .leading) {
            Image(movie.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            
            Text(movie.title)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            RatingView(movie.rating)
                .padding(.vertical, 1)
        }
        .padding(.leading, 16)
    }
    
    private func buildPopularSection(state: HomeViewModelState) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(state.popularMoviesTitle)
                    .font(.headline)
                
                Spacer()
                
                buildSectionButton(title: "See more") {
                    print("open a list of popular movies?")
                }
            }
            .padding(.horizontal)
            
            List(state.popularMovies, id: \.title) { movie in
                let isLast = movie == state.popularMovies.last
                buildPopularSectionItem(movie)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: isLast ? 0: 8, trailing: 16))
            }
            .listStyle(.plain)
        }
    }
    
    private func buildPopularSectionItem(_ movie: HomeMovie) -> some View {
        HStack {
            Image(movie.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                RatingView(movie.rating)
                    .padding(.vertical, 1)
                
                HStack {
                    ForEach(movie.genre ?? [], id: \.self) { genre in
                        PillTextView(text: genre)
                    }
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .font(.caption)
                    Text(movie.duration ?? "")
                        .font(.caption)
                }
                .padding(.vertical, 2)
                
            }
        }
    }
    
    private func buildSectionButton(title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.caption2)
                .foregroundColor(.gray)
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .overlay(
                    Capsule()
                        .stroke(.gray, lineWidth: 1)
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(viewModel: HomeViewModel())
    }
}
