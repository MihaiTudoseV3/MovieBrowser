//
//  MovieDetailsViewModelTests.swift
//  MovieBrowserTests
//
//  Created by Mihai Tudose on 30.01.2025.
//

import XCTest

@testable import MovieBrowser

class MovieDetailsViewModelTests: XCTestCase {
    
    var viewModel: MovieDetailsViewModel!
    var mockFetchMovieUseCase: FetchMovieUseCaseMock!
    
    override func setUp() {
        super.setUp()
        mockFetchMovieUseCase = FetchMovieUseCaseMock()
        viewModel = MovieDetailsViewModel(movieId: "tt0944947", fetchMovieUseCase: mockFetchMovieUseCase)
    }
    
    override func tearDown() {
        viewModel = nil
        mockFetchMovieUseCase = nil
        super.tearDown()
    }
    
    // Test Initialization
    func test_viewModel_initialization() {
        // Assert that the initial state is set to .notInitialized
        XCTAssertEqual(viewModel.state.content, .notInitialized)
        // Assert that the movieId was set
        XCTAssertEqual(viewModel.movieId, "tt0944947")
    }
    
    // Test Successful Fetch
    func test_fetchMovie_success_setsStateToLoaded() {
        // Given
        let expectedMovie = MovieDetails.makeMovieDetails()
        mockFetchMovieUseCase.result = .success(movie: expectedMovie)
        
        // When
        viewModel.fetchMovie()
        
        // Then
        XCTAssertEqual(viewModel.state.content, .loading) // It should first be in loading state
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(self.viewModel.state.content, .loaded(expectedMovie))
        }
    }
    
    // Test Failure
    func test_fetchMovie_failure_setsStateToError() {
        // Given
        mockFetchMovieUseCase.result = .failure(error: .notFound)
        
        // When
        viewModel.fetchMovie()
        
        // Then
        XCTAssertEqual(viewModel.state.content, .loading) // It should first be in loading state
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(self.viewModel.state.content, .error(FetchMovieUseCaseMock.FetchError.notFound.localizedDescription))
        }
    }
}
