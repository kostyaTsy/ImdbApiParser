//
//  MovieListView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 1.06.22.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel = ApiCall<Movies>()
    var category: String
    
    var body: some View {
        if viewModel.dataModel?.items.count ?? 0 > 0 {
            List(viewModel.dataModel?.items ?? [], id: \.self) { movie in
                // TODO: add navigation link
                NavigationLink(destination: MovieDescriptionView(movieId: movie.id)) {
                    MovieCell(movie: movie)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(category)
        }
        else {
            ProgressView()
                .onAppear {
                    if viewModel.dataModel?.items.count ?? 0 == 0 {
                        let newCategory = category.replacingOccurrences(of: " ", with: "")
                        guard let url = URL(string: "https://imdb-api.com/en/API/\(newCategory)/k_zv8c981k") else { return }
                        viewModel.fetch(url: url)
                    }
                }
                .alert(viewModel.errorMessage ?? "", isPresented: $viewModel.isError) {
                    Button("OK", role: .cancel) { }
                }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(category: "Top 250")
    }
}
