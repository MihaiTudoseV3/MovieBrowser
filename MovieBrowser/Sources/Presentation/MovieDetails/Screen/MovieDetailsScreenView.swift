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
                    buildHeader()
                    buildBody(content: viewModel.state.content)
                }
                .frame(minWidth: geometry.size.width, minHeight: geometry.size.height)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            viewModel.fetchMovie()
        }
    }
    
    private func buildHeader() -> some View {
        HStack {
            Button {
                router.pop()
            } label: {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.gray)
            }
            Spacer()
            Button {
                router.navigateTo(.notInScope)
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 32)
        .padding(.vertical)
    }
    
    private func buildBody(content: MovieDetailsViewModelState.Content) -> some View {
        VStack {
            Spacer()
            Group {
                switch content {
                case .notInitialized:
                    EmptyView()
                case .loading:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                case .loaded(_):
                    buildLoadedBody()
                case .error(let error):
                    buildErrorBody(error)
                }
            }
            Spacer()
        }
    }
    
    private func buildLoadedBody() -> some View {
        Text("Loaded...")
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
