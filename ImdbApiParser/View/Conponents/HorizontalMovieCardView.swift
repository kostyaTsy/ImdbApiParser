//
//  HorizontalMoviewCardView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 27.05.22.
//

import SwiftUI

struct HorizontalMovieCardView: View {
    var movie: MovieModel
    
    var body: some View {
        VStack {
            UrlImageView(urlString: movie.image, imgWidth: imgWidth, imgHeight: imgHeight)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
                Text(movie.imDbRating)
            }
            .font(.subheadline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.vertical, 10)
            
            Text(movie.title)
                .font(.body)
                .frame(minWidth: imgWidth-1, maxWidth: imgWidth+1, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .background(Color(UIColor(named: "HomeCard") ?? .white))
        .cornerRadius(20)
        .shadow(color: .gray, radius: shadowRadius, x: 0, y: shadowPosY)
    }
    
    // MARK: constants
    let imgWidth: CGFloat = 150
    let imgHeight: CGFloat = 250
    let shadowRadius: CGFloat = 20
    let shadowPosY: CGFloat = 320 // imgHeight + 70
}

struct HorizontalMovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalMovieCardView(movie: MovieModel(id: "11", title: "Film", image: "", imDbRating: "8.1"))
    }
}
