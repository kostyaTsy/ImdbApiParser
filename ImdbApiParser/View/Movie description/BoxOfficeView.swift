//
//  BoxOfficeView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 28.05.22.
//

import SwiftUI

struct BoxOfficeView: View {
    var movieBoxOffice: MovieInfoModel.BoxOffice
    var body: some View {
        if movieBoxOffice.budget != "" || movieBoxOffice.openingWeekendUSA != "" || movieBoxOffice.grossUSA != "" || movieBoxOffice.cumulativeWorldwideGross != "" {
            Section {
                VStack {
                    Text("Box office")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top])
                        .padding(.bottom, 5)
                    
                    Divider()
                    if movieBoxOffice.budget != "" {
                        Text("**Budget:** \(movieBoxOffice.budget)")
                            .font(.callout)
                            .padding(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if movieBoxOffice.openingWeekendUSA != "" {
                        Text("**Opening Weekend:** \(movieBoxOffice.openingWeekendUSA)")
                            .font(.callout)
                            .padding(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if movieBoxOffice.grossUSA != "" {
                        Text("**Gross:** \(movieBoxOffice.grossUSA)")
                            .font(.callout)
                            .padding(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if movieBoxOffice.cumulativeWorldwideGross != "" {
                        Text("**Worldwide Gross:** \(movieBoxOffice.cumulativeWorldwideGross)")
                            .font(.callout)
                            .padding(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.bottom)
            }
        }
    }
}

struct BoxOfficeView_Previews: PreviewProvider {
    static var model: MovieInfoModel = load("movieInfo.json")
    static var previews: some View {
        BoxOfficeView(movieBoxOffice: model.boxOffice)
    }
}
