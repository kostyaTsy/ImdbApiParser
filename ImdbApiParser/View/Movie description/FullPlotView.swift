//
//  FullPlotView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 28.05.22.
//

import SwiftUI

struct FullPlotView: View {
    var plot: String
    var title: String
    
    var body: some View {
        ScrollView {
            Text(plot)
                .font(.body)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle("Plot: \(title)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FullPlotView_Previews: PreviewProvider {
    static var previews: some View {
        FullPlotView(plot: "fas dlfhajkshdf jkladfhajksdf kladf afa fhjadsfkadsf", title: "dfs")
    }
}
