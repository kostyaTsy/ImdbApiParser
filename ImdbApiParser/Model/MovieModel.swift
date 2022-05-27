//
//  MovieModel.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 25.05.22.
//

import Foundation

struct Movies: Codable {
    let items: [MovieModel]
    let errorMessage: String
}

struct MovieModel: Codable, Hashable {
    let id, title, image, imDbRating: String
    /*let id, rank, title: String
    let fullTitle, year: String
    let image, crew, imDbRating, imDbRatingCount: String*/
}

