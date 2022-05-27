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
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 10) {
                    ForEach(movies, id: \.self) {movie in
                        NavigationLink(destination: MovieDescriptionView()) {
                            HorizontalMovieCardView(movie: movie)
                            
                            /*VStack {
                                UrlImageView(urlString: movie.image, imgWidth: imgWidth, imgHeight: imgHeight)
                                /*if let url = URL(string: movie.image) {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: imgWidth, height: imgHeight)
                                            
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                }
                                else {
                                    Image(systemName: "house")
                                        .resizable()
                                        .frame(height: imgHeight)
                                }*/
                                
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
                            .shadow(color: .gray, radius: shadowRadius, x: 0, y: shadowPosY)*/
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
