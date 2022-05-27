//
//  CastView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 27.05.22.
//

import SwiftUI

struct CastView: View {
    var urlString: String
    var name, movieName: String
    
    var body: some View {
        VStack {
            UrlImageView(urlString: urlString, imgWidth: imgWidth, imgHeight: imgHeight)
                .clipped()
            Text(name)
                .font(.caption)
                .lineLimit(1)
            Text(movieName)
                .font(.caption2)
                .lineLimit(1)
        }
        .frame(width: imgWidth)
    }
    
    // MARK: constants
    let imgWidth: CGFloat = 100
    let imgHeight: CGFloat = 150
}

struct CastView_Previews: PreviewProvider {
    static var previews: some View {
        CastView(urlString: "", name: "Kostya sdfads dfsfddh", movieName: "jhon sysd")
            .preferredColorScheme(.dark)
    }
}
