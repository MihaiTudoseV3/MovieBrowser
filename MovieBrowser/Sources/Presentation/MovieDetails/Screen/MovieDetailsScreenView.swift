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
                    Text("Loaded...")
                case .error(let error):
                    Text(error)
                }
            }
            Spacer()
        }
    }
    
    private func buildLoadingBody() -> some View {
        EmptyView()
    }
}

struct MovieDetailsScreenView_Preview: PreviewProvider {
    static var previews: some View {
        MovieDetailsScreenView(viewModel: MovieDetailsViewModel(movie: HomeMovie.makeMovie()))
            .withRouter()
    }
}
