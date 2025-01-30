//
//  Movie+Mock.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 28.01.2025.
//

extension HomeMovie {
    static func makeNowShowingMovies() -> [HomeMovie] {
        [
            HomeMovie(id: "tt10872600", title: "Spiderman: No Way Home", rating: "9.1/10 IMDb", image: "spiderman", genre: nil, duration: nil),
            HomeMovie(id: "tt9032400", title: "Eternals", rating: "9.5/10 IMDb", image: "eternals", genre: nil, duration: nil),
            HomeMovie(id: "tt9376612", title: "Shang-Chi", rating: "8.1/10 IMDb", image: "shang_chi", genre: nil, duration: nil)
        ]
    }
    
    static func makePopularMovies() -> [HomeMovie] {
        [
            HomeMovie(id: "tt7097896", title: "Venom Let There Be Carnage", rating: "6.4/10 IMDb", image: "venom", genre: ["Horror", "Mystery", "Thriller"], duration: "1h 47m"),
            HomeMovie(id: "tt6856242", title: "The King's Man", rating: "8.4/10 IMDb", image: "kings_man", genre: ["Action", "Fantasy"], duration: "1h 47m")
        ]
    }
    
    static func makeMovie() -> HomeMovie {
        makeNowShowingMovies().first!
    }
}
