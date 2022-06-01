//
//  MovieSearchListView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 1.06.22.
//

import SwiftUI

struct MovieSearchListView: View {
    var movieSearchResult: [MovieSearchInfoModel]
    
    var body: some View {
        List(movieSearchResult, id: \.self) { movie in
            NavigationLink(destination: MovieDescriptionView(movieId: movie.id)) {
                MovieSearchCell(movie: movie)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct MovieSearchListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchListView(movieSearchResult: [MovieSearchInfoModel]())
    }
}
