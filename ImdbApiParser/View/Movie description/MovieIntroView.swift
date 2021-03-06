//
//  MovieIntroView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 27.05.22.
//

import SwiftUI
import AVKit

struct MovieIntroView: View {
    
    var movieInfoArr: MovieInfoModel
    
    var body: some View {
        VStack {
            Text(movieInfoArr.title)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top])
                .padding(.bottom, 5)
            HStack(spacing: 15) {
                
                // Output type if title is not a movie
                if movieInfoArr.type != "Movie" {
                    Text(movieInfoArr.type)
                }
                Text(movieInfoArr.year)
                Text(movieInfoArr.contentRating)
                Text(movieInfoArr.runtimeStr ?? "")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .font(.subheadline)
            
            Divider()
            
            HStack {
                // TODO: on tap show full image
                UrlImageView(urlString: movieInfoArr.image, imgWidth: imgWidth, imgHeight: imgHeight)
                    .clipped()
                    .padding()
                
                VStack {
                    // Genere scroll
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(movieInfoArr.genreList, id: \.self) { genere in
                                VStack {
                                    Text(genere.value)
                                        .font(.subheadline)
                                        .padding(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(.gray, lineWidth: 1)
                                        )
                                }
                            }
                        }
                    }
                    
                    // TODO: show full plot on tap
                    NavigationLink(destination: FullPlotView(plot: movieInfoArr.plot, title: movieInfoArr.fullTitle)) {
                        Text(movieInfoArr.plot)
                            .font(.subheadline)
                            .padding(.leading, 4)
                            .padding(.trailing)
                            .frame(maxWidth: .infinity, maxHeight: plotHeight, alignment: .leading)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            
            Divider()
                .padding(.bottom)
            HStack {
                // Imdb rating
                VStack {
                    Image(systemName: "star.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.orange)
                    Text(movieInfoArr.imDbRating).font(.title2).bold() + Text("/10").font(.body)
                    Text("\(Int(movieInfoArr.imDbRatingVotes) ?? 0)")
                        .font(.body)
                        .padding(.bottom, 10)
                }
                .padding(.leading, 30)
                
                // MetaScore
                if let metacriticRating = movieInfoArr.metacriticRating {
                    Spacer()
                    VStack {
                        Text(metacriticRating)
                            .padding(5)
                            .background(Color(.green))
                            .font(.title2)
                        Text("Metascore")
                    }
                    .padding(.trailing, 30)
                }
            }
            Spacer()
            
        }
    }
    
    // MARK: constant
    let plotHeight: CGFloat = 150
    let imgHeight: CGFloat = 250
    let imgWidth: CGFloat = 150
}

struct MovieIntroView_Previews: PreviewProvider {
    static var model: MovieInfoModel = load("movieInfo.json")
    static var previews: some View {
        MovieIntroView(movieInfoArr: model)
    }
}
