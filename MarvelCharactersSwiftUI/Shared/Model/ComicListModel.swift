//
//  ComicListModel.swift
//  MarvelCharactersSwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 7/1/22.
//

import Foundation

struct ComicListModel: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: ComicDataClass?
}

// MARK: - DataClass
struct ComicDataClass: Codable {
    let offset, limit, total, count: Int?
    let results: [ComicResults]?
}

// MARK: - Result
struct ComicResults: Identifiable, Codable {
    let id, digitalID: Int?
    let title: String?
    let issueNumber: Int?
    let variantDescription, comicResultsDescription: String?
    let modified: String?
    let isbn, upc, diamondCode, ean: String?
    let issn, format: String?
    let pageCount: Int?
    let resourceURI: String?
    let urls: [URLElement]?
    let series: Series?
    let variants: [Series]?
    let dates: [DateElement]?
    let prices: [Price]?
    let thumbnail: Thumbnail?
    let creators, characters, stories, events: Characters?

    enum CodingKeys: String, CodingKey {
        case id
        case digitalID = "digitalId"
        case title, issueNumber, variantDescription
        case comicResultsDescription = "description"
        case modified, isbn, upc, diamondCode, ean, issn, format, pageCount, resourceURI, urls, series, variants, dates, prices, thumbnail, creators, characters, stories, events
    }
}

// MARK: - Characters
struct Characters: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [Item]?
    let returned: Int?
}

// MARK: - Item
struct Item: Codable {
    let resourceURI: String?
    let name: String?
    let role, type: String?
}

// MARK: - DateElement
struct DateElement: Codable {
    let type: String?
    let date: String
}

// MARK: - Price
struct Price: Codable {
    let type: String?
    let price: Int?
}


enum Title: String, Codable {
    case marvelPreviews2017 = "Marvel Previews (2017)"
    case marvelPreviews2017Present = "Marvel Previews (2017 - Present)"
}




