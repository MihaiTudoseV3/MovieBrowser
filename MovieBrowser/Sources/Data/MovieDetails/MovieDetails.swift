//
//  MovieDetails.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 29.01.2025.
//
import Foundation

struct MovieDetails: Equatable {
    let id: String
    let title: String?
    let imdbRating: String?
    let duration: String?
    let genres: [String]
    let plot: String?
    let coverImageUrl: String?
    let certificateRating: String?
    let language: String?
    let cast: [Cast]
        
    struct Cast: Equatable {
        let name: String?
        let imageUrl: String?
    }
}
