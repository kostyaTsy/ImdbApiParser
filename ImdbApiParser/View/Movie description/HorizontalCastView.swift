//
//  HorizontalCastView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 27.05.22.
//

import SwiftUI

struct HorizontalCastView: View {
    //var actorsList: [MovieInfoModel.ActorList]
    var movieInfo: MovieInfoModel
    var body: some View {
        VStack {
            Text("Cast")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Divider()
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 20) {
                    ForEach(movieInfo.actorList, id: \.self) { actorInfo in
                        CastView(urlString: actorInfo.image, name: actorInfo.name, movieName: actorInfo.asCharacter)
                    }
                }
                .padding()
            }
            
            Divider()
            
            VStack {
                // Directors info
                Text("**Directors:** \(movieInfo.directors)")
                    .font(.body)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                // Writers info
                Text("**Writers:** \(movieInfo.writers)")
                    .font(.body)
                    .padding(.leading)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct HorizontalCastView_Previews: PreviewProvider {
    static var model: MovieInfoModel = load("movieInfo.json")
    static var previews: some View {
        HorizontalCastView(movieInfo: model)
    }
}
