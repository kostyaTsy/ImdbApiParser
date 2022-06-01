//
//  MovieSearchCell.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 1.06.22.
//

import SwiftUI

struct MovieSearchCell: View {
    var movie: MovieSearchInfoModel
    
    var body: some View {
        HStack {
            UrlImageView(urlString: movie.image, imgWidth: imgWidth, imgHeight: imgHeight)
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.body)
            }
            .padding()
        }
    }
    
    // MARK: - constants
    let imgWidth: CGFloat = 105
    let imgHeight: CGFloat = 175
}

struct MovieSearchCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchCell(movie: MovieSearchInfoModel(id: "1232", image: "", title: "Inception"))
    }
}
