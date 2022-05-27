//
//  MovieDescriptionView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 27.05.22.
//

import SwiftUI

// All information about film, title, plot, cast, similar films
struct MovieDescriptionView: View {
    
    @State var movieInfoArr: MovieInfoModel = load("movieInfo.json")
    
    var body: some View {
        ScrollView {
            
            // Section with film description
            Section {
                MovieIntroView(movieInfoArr: movieInfoArr)
                /*VStack {
                    Text(movieInfoArr.title)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top])
                        .padding(.bottom, 5)
                    HStack(spacing: 15) {
                        Text(movieInfoArr.year)
                        Text(movieInfoArr.contentRating)
                        Text(movieInfoArr.runtimeStr)
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
                            Text(movieInfoArr.plot)
                                .font(.subheadline)
                                .frame(maxWidth: .infinity, maxHeight: plotHeight, alignment: .leading)
                                .padding(4)
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
                        Spacer()
                        
                        // MetaScore
                        VStack {
                            Text(movieInfoArr.metacriticRating)
                                .padding(5)
                                .background(Color(.green))
                                .font(.title2)
                            Text("Metascore")
                        }
                        .padding(.trailing, 30)
                    }
                    Spacer()
                    
                }*/
            }
            .background(Color(uiColor: UIColor(named: "FullFilmCard") ?? .secondarySystemBackground))
            .padding(.bottom)
            
            // Section with cast
            Section {
                HorizontalCastView(actorsList: movieInfoArr.actorList)
                /*VStack {
                    Text("Cast")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Divider()
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 20) {
                            ForEach(movieInfoArr.actorList, id: \.self) { actorInfo in
                                CastView(urlString: actorInfo.image, name: actorInfo.name, movieName: actorInfo.asCharacter)
                            }
                        }
                        .padding()
                    }
                    
                    Divider()
                }*/
                
            }
            .background(Color(uiColor: UIColor(named: "FullFilmCard") ?? .secondarySystemBackground))
            .padding(.bottom)
            
            // Section with similar films
            Section {
                HorizontalScrollView(movies: movieInfoArr.similars, title: "More like this")
            }
            .background(Color(uiColor: UIColor(named: "FullFilmCard") ?? .secondarySystemBackground))
            .padding(.bottom)

            
        }
        .background(Color(uiColor: UIColor(named: "BackColor") ?? .systemBackground))
        .navigationTitle(movieInfoArr.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: constants
    let plotHeight: CGFloat = 150
    let imgHeight: CGFloat = 250
    let imgWidth: CGFloat = 150
}

struct MovieDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDescriptionView()
            .preferredColorScheme(.dark)
    }
}
