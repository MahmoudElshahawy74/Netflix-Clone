//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Mahmoud Elshahawy on 31/07/2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - YoutubeSearchResults
struct YoutubeSearchResponse: Codable {
    let kind, etag, nextPageToken, regionCode: String?
    let pageInfo: PageInfo?
    let items: [VideoElement]?
}

// MARK: - Item
struct VideoElement: Codable {
    let kind, etag: String?
    let id: ID?
}

// MARK: - ID
struct ID: Codable {
    let kind, videoID, playlistID: String?

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
        case playlistID = "playlistId"
    }
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int?
}

