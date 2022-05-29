//
//  MovieInfoModel.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 27.05.22.
//

import Foundation

// If add TVs rebuild model, add some optinals
struct MovieInfoModel: Codable {
    let title, originalTitle, fullTitle: String
    let type, year, image: String
    let releaseDate, runtimeStr: String
    let plot: String
    
    let directors, writers: String
    let actorList: [ActorList]
    struct ActorList: Codable, Hashable {
        let id, image, name, asCharacter: String
    }
    
    let genreList: [GenreList]
    struct GenreList: Codable, Hashable {
        let key, value: String
    }
    
    let companies, countries: String
    let contentRating: String
    let imDbRating, imDbRatingVotes, metacriticRating: String
    
    let boxOffice: BoxOffice
    struct BoxOffice: Codable {
        let budget, openingWeekendUSA, grossUSA, cumulativeWorldwideGross: String
    }
    
    let similars: [MovieModel]
    /*struct MovieSimList: Codable, Hashable {
        let id, title, image, imDbRating: String
    }*/
    
    let tvSeriesInfo, tvEpisodeInfo, errorMessage: String?
}
