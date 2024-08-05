// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)


import Foundation

struct TrendingTitleResponse: Codable {
    let page: Int?
    let results: [Title]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Movie
struct Title: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum MovieMediaType: String, Codable {
    case movie = "movie"
}

enum MovieOriginalLanguage: String, Codable {
    case en = "en"
    case hi = "hi"
}


 // MARK: - TrendingMoviesResponse
 //struct TrendingMoviesResponse: Codable {
 //    let page: Int?
 //    let results: [Movie]?
 //    let totalPages, totalResults: Int?
 //
 //    enum CodingKeys: String, CodingKey {
 //        case page, results
 //        case totalPages = "total_pages"
 //        case totalResults = "total_results"
 //    }
 //}
 //
 //// MARK: - Movie
 //struct Movie: Codable {
 //    let adult: Bool?
 //    let backdropPath: String?
 //    let id: Int?
 //    let title, originalTitle, overview, posterPath: String?
 //    let mediaType: MovieMediaType?
 //    let originalLanguage: MovieOriginalLanguage?
 //    let genreIDS: [Int]?
 //    let popularity: Double?
 //    let releaseDate: String?
 //    let video: Bool?
 //    let voteAverage: Double?
 //    let voteCount: Int?
 //
 //    enum CodingKeys: String, CodingKey {
 //        case backdropPath = "backdrop_path"
 //        case id, title
 //        case originalTitle = "original_title"
 //        case overview
 //        case posterPath = "poster_path"
 //        case mediaType = "media_type"
 //        case adult
 //        case originalLanguage = "original_language"
 //        case genreIDS = "genre_ids"
 //        case popularity
 //        case releaseDate = "release_date"
 //        case video
 //        case voteAverage = "vote_average"
 //        case voteCount = "vote_count"
 //    }
 //}

//-----------------------------------------------------------------------------
// Instance method 'decode(_:from:)' requires that 'TrendingMovieResponse' conform to 'Decodable'
//struct TrendingMoviesResponse: Codable { // codable is decoder protocol 
//    let results: [Movie]?
//}
//
//
//struct Movie: Codable {
//    let id: Int?
//    let media_type: String?
//    let original_name: String?
//    let original_title: String?
//    let poster_path: String?
//    let overview: String?
//    let vote_count: Int?
//    let release_date: String?
//    let vot_average: Double
//}
