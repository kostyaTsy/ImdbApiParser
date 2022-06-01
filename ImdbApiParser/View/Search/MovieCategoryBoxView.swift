//
//  MovieCategoryBoxView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 1.06.22.
//

import SwiftUI

struct MovieCategoryBoxView: View {
    var category: String
    
    var body: some View {
        HStack {
            Text(category)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(width: 170, height: 120)
        .background(Color(UIColor(named: "FullFilmCard") ?? .secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct MovieCategoryBoxView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategoryBoxView(category: "Hello")
            .preferredColorScheme(.dark)
    }
}
