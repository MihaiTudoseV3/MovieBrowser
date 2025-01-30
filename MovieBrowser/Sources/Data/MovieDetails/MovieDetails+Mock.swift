//
//  MovieDetails+Mock.swift
//  MovieBrowser
//
//  Created by Mihai Tudose on 30.01.2025.
//

extension MovieDetails {
    static func makeMovieDetails() -> MovieDetails {
        .init(id: "tt0944947",
              title: "Game of Thrones",
              imdbRating: "9.2/10 IMDb",
              duration: "1h 9min",
              genres: ["Action", "Adventure", "Drama"],
              plot: "Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for a millennia.",
              coverImageUrl: "https://m.media-amazon.com/images/M/MV5BN2IzYzBiOTQtNGZmMi00NDI5LTgxMzMtN2EzZjA1NjhlOGMxXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg",
              certificateRating: "TV-MA",
              language: "English",
              cast: [.init(name: "Peter Dinklage",
                           imageUrl: "https://m.media-amazon.com/images/M/MV5BMTM1MTI5Mzc0MF5BMl5BanBnXkFtZTYwNzgzOTQz._V1_.jpg"),
                     .init(name: "Lena Headey",
                           imageUrl: "https://m.media-amazon.com/images/M/MV5BMzIwMjIwNjg0M15BMl5BanBnXkFtZTgwOTI3MDEzMDE@._V1_.jpg")])
    }
}
