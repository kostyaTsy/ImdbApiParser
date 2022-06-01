//
//  MovieSearchModel.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 1.06.22.
//

import Foundation

struct MovieSearchModel: Codable, Hashable {
    let results: [MovieSearchInfoModel]
    let errorMessage: String
}

struct MovieSearchInfoModel: Codable, Hashable {
    let id, image, title: String
}
