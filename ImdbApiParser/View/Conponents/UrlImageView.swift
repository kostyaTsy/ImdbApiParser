//
//  UrlImageView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 26.05.22.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    var imgWidth: CGFloat
    var imgHeight: CGFloat
    
    init(urlString: String, imgWidth: CGFloat, imgHeight: CGFloat) {
        urlImageModel = UrlImageModel(urlString: urlString)
        self.imgWidth = imgWidth
        self.imgHeight = imgHeight
    }
    
    var body: some View {
        //Image(uiImage: (urlImageModel.uiImage ?? UIImage(systemName: "house"))!)
        Image(uiImage: (urlImageModel.uiImage ?? UIImage(named: "Placeholder")!))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: imgWidth, height: imgHeight)
            //.clipped()
    }
}

/*struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView()
    }
}*/
