//
//  MoviesModel.swift
//  ExtolTest
//
//  Created by Muhammad Zeeshan on 22/10/2022.
//

import Foundation

struct AllMoviesModel: Codable {
    let dates: Dates?
    let page: Int?
    let results: [ResultModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dates = try container.decodeIfPresent(Dates.self, forKey: .dates)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page)
        self.results = try container.decodeIfPresent([ResultModel].self, forKey: .results)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        self.totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    }
}

struct Dates: Codable {
    let maximum, minimum: String?
}
