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
            }
            .background(Color(uiColor: UIColor(named: "FullFilmCard") ?? .secondarySystemBackground))
            .padding(.bottom)
            
            // Section with cast
            Section {
                HorizontalCastView(actorsList: movieInfoArr.actorList)
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
}

struct MovieDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDescriptionView()
            .preferredColorScheme(.dark)
    }
}
