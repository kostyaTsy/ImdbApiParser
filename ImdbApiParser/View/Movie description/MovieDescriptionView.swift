//
//  MovieDescriptionView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 27.05.22.
//

import SwiftUI

// All information about film, title, plot, cast, similar films
struct MovieDescriptionView: View {
    @ObservedObject var movieInfoViewModel = ApiCall<MovieInfoModel>()
    var movieId: String
    //@State var movieInfoArr: MovieInfoModel = load("movieInfo.json")
    
    var body: some View {
        if let dataModel = movieInfoViewModel.dataModel {
            ScrollView {
                
                // Section with film description
                Section {
                    MovieIntroView(movieInfoArr: dataModel)
                }
                .background(Color(uiColor: UIColor(named: "FullFilmCard") ?? .secondarySystemBackground))
                .padding(.bottom)
                
                // Section with cast
                Section {
                    HorizontalCastView(movieInfo: dataModel)
                }
                .background(Color(uiColor: UIColor(named: "FullFilmCard") ?? .secondarySystemBackground))
                .padding(.bottom)
                
                // Section with similar films
                Section {
                    HorizontalScrollView(movies: dataModel.similars, title: "More like this")
                }
                .background(Color(uiColor: UIColor(named: "FullFilmCard") ?? .secondarySystemBackground))
                .padding(.bottom)
                
                // Section with box office
                BoxOfficeView(movieBoxOffice: dataModel.boxOffice)
                    .background(Color(uiColor: UIColor(named: "FullFilmCard") ?? .secondarySystemBackground))
                    .padding(.bottom)
                

                
            }
            .background(Color(uiColor: UIColor(named: "BackColor") ?? .systemBackground))
            .navigationTitle(movieInfoViewModel.dataModel?.title ?? "")
            .navigationBarTitleDisplayMode(.inline)
            /*.onAppear {
                // TODO: think about if
                if movieInfoViewModel.dataModel == nil {
                    guard let url = URL(string: "https://imdb-api.com/en/API/Title/k_zv8c981k/\(movieId)") else { return }
                    movieInfoViewModel.fetch(url: url)
                }
            }*/
        }
        else {
            ProgressView()
                .onAppear {
                    if movieInfoViewModel.dataModel == nil {
                        guard let url = URL(string: "https://imdb-api.com/en/API/Title/k_zv8c981k/\(movieId)") else { return }
                        movieInfoViewModel.fetch(url: url)
                    }
                }
        }
    }
}

struct MovieDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDescriptionView(movieId: "tt1375666")
            .preferredColorScheme(.dark)
    }
}
