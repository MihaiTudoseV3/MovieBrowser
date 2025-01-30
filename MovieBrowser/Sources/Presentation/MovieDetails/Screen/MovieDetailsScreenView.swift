//
//  MovieDetailsScreenView.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//

import SwiftUI

struct MovieDetailsScreenView: View {
    
    @StateObject var viewModel: MovieDetailsViewModel
    @Environment(Router.self) var router
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                ZStack(alignment: .top) {
                    buildBody(content: viewModel.state.content)
                        .padding(.top, -geometry.safeAreaInsets.top)
                    buildHeader()
                }
                .frame(minWidth: geometry.size.width, minHeight: geometry.size.height)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .onAppear() {
            viewModel.fetchMovie(onAppear: true)
        }
    }
    
    private func buildHeader() -> some View {
        HStack {
            Button {
                router.pop()
            } label: {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.white)
            }
            Spacer()
            Button {
                router.navigateTo(.notInScope)
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical)
    }
    
    private func buildBody(content: MovieDetailsViewModelState.Content) -> some View {
        VStack {
            Group {
                switch content {
                case .notInitialized:
                    EmptyView()
                case .loading:
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                case .loaded(let movie):
                    buildLoadedBody(movie)
                case .error(let error):
                    Spacer()
                    buildErrorBody(error)
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private func buildLoadedBody(_ movie: MovieDetails) -> some View {
        ZStack(alignment: .bottom){
            asyncImage(url: movie.coverImageUrl ?? "")
            Color.white
                .frame(height: 20)
                .cornerRadius(20, antialiased: true)
                .padding(.bottom, -10)
        }
        VStack(alignment: .leading, spacing: 20){
            HStack {
                Text(movie.title ?? "")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                Image(systemName: "bookmark")
            }
            
            RatingView(movie.imdbRating ?? "")
            
            HStack {
                ForEach(movie.genres, id: \.self) { genre in
                    PillTextView(text: genre)
                }
            }
            
            HStack {
                MovieInfoView(title: "Length", value: movie.duration ?? "")
                MovieInfoView(title: "Language", value: movie.language ?? "")
                MovieInfoView(title: "Rating", value: movie.certificateRating ?? "")
            }
            .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Description")
                    .font(.headline)
                Text(movie.plot ?? "")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("Cast")
                    .font(.headline)
                
                Spacer()
                
                PillButtonView(title: "See more", action: {
                    router.navigateTo(.notInScope)
                })
            }
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(movie.cast, id: \.self) { member in
                        CastMemberView(imageUrl: member.imageUrl ?? "", name: member.name ?? "")
                    }
                }
            }
            
        }
        .padding(.horizontal, 24)
        .padding(.top, 10)
    }
    
    private func asyncImage(url: String) -> some View {
        Group{
            if let url = URL(string: url) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            Image(systemName: "movieclapper")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 300)
                                .clipped()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxHeight: 300)
                            .clipped()
                    case .failure:
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 300)
                            .clipped()
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                EmptyView()
            }
        }
    }
    
    private func buildErrorBody(_ error: String) -> some View {
        VStack{
            Text(error)
            Button {
                viewModel.fetchMovie()
            } label: {
                Text("Retry")
            }
        }
        .padding()
    }
}

#Preview("MovieDetailsScreenView_Loading") {
    MovieDetailsScreenView(viewModel: MovieDetailsViewModel(movieId: "", fetchMovieUseCase: FetchMovieUseCaseMock(result: .never)))
        .withRouter()
}

#Preview("MovieDetailsScreenView_Success") {
    MovieDetailsScreenView(viewModel: MovieDetailsViewModel(movieId: "", fetchMovieUseCase: FetchMovieUseCaseMock(result: .success(movie: MovieDetails.makeMovieDetails()))))
        .withRouter()
}

#Preview("MovieDetailsScreenView_Error") {
    MovieDetailsScreenView(viewModel: MovieDetailsViewModel(movieId: "", fetchMovieUseCase: FetchMovieUseCaseMock(result: .failure(error: .notFound))))
        .withRouter()
}
