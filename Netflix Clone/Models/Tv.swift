//
//  Tv.swift
//  Netflix Clone
//
//  Created by Mahmoud Elshahawy on 24/07/2024.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - TrendingTvResponse
struct TrendingTvResponse: Codable {
    let page: Int?
    let results: [Tv]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Tv
struct Tv: Codable {
    let backdropPath: String?
    let id: Int?
    let name, originalName, overview, posterPath: String?
    let mediaType: TvMediaType?
    let adult: Bool?
    let originalLanguage: TvOriginalLanguage?
    let genreIDS: [Int]?
    let popularity: Double?
    let firstAirDate: String?
    let voteAverage: Double?
    let voteCount: Int?
    let originCountry: [String]?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, name
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
    }
}

enum TvMediaType: String, Codable {
    case tv = "tv"
}

enum TvOriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case ko = "ko"
    case zh = "zh"
}
