//
//  MovieCell.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 1.06.22.
//

import SwiftUI

struct MovieCell: View {
    var movie: MovieModel
    
    var body: some View {
        HStack {
            UrlImageView(urlString: movie.image, imgWidth: imgWidth, imgHeight: imgHeight)
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.body)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                    Text(movie.imDbRating)
                }
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                //.padding(.vertical, 10)
            }
            .padding()
        }
    }
    
    // MARK: - constants
    let imgWidth: CGFloat = 105
    let imgHeight: CGFloat = 175
}

struct MovieCell_Previews: PreviewProvider {
    static var movies: Movies = load("movies.json")
    static var previews: some View {
        MovieCell(movie: movies.items[0])
    }
}
