//
//  Movie+Mock.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

extension HomeMovie {
    static func makeNowShowingMovies() -> [HomeMovie] {
        [
            HomeMovie(title: "Spiderman: No Way Home", rating: "9.1/10 IMDb", image: "spiderman", genre: nil, duration: nil),
            HomeMovie(title: "Eternals", rating: "9.5/10 IMDb", image: "eternals", genre: nil, duration: nil),
            HomeMovie(title: "Shang-Chi", rating: "8.1/10 IMDb", image: "shangchi", genre: nil, duration: nil)
        ]
    }
    
    static func makePopularMovies() -> [HomeMovie] {
        [
            HomeMovie(title: "Venom Let There Be Carnage", rating: "6.4/10 IMDb", image: "venom", genre: ["Horror", "Mystery", "Thriller"], duration: "1h 47m"),
            HomeMovie(title: "The King's Man", rating: "8.4/10 IMDb", image: "kingsman", genre: ["Action", "Fantasy"], duration: "1h 47m")
        ]
    }
}
