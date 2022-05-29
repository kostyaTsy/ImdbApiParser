//
//  HorizontalScrollView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 24.05.22.
//

import SwiftUI

struct HorizontalScrollView: View {
    @State var movies: [MovieModel]
    @State var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top])
                .padding(.bottom, 5)
            Divider()
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 10) {
                    ForEach(movies, id: \.self) {movie in
                        NavigationLink(destination: MovieDescriptionView(movieId: movie.id)) {
                            HorizontalMovieCardView(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.bottom)
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .background(Color(UIColor(named: "FullFilmCard") ?? .secondarySystemBackground))
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollView(movies: movies.items, title: "Title")
            .preferredColorScheme(.light)
    }
}
