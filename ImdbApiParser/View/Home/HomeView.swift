//
//  HomeView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 24.05.22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = ApiCall<Movies>()
    var titleArray = ["1", "2", "3", "4", "5"]
    
    var body: some View {
        NavigationView {
            if viewModel.dataModel?.items.count ?? 0 > 0 {
                ScrollView {
                    
                    ForEach(0..<5) { ind in
                        let arr = viewModel.dataModel?.items
                        let tmpMovieArr = Array(arr![(ind * 10)..<(ind * 10 + 10)])
                        HorizontalScrollView(movies: tmpMovieArr, title: titleArray[ind])
                            .padding(.bottom)
                    }
                }
                .background(Color(UIColor(named: "BackColor") ?? .systemBackground))
                .navigationTitle("What to watch")
                //.navigationBarTitleDisplayMode(.inline)
            }
            else {
                ProgressView()
            }
        }
        .alert(viewModel.errorMessage ?? "", isPresented: $viewModel.isError) {
            Button("OK", role: .cancel) { }
        }
        .onAppear {
            if viewModel.dataModel?.items.count ?? 0 == 0 {
                guard let url = URL(string: "https://imdb-api.com/en/API/MostPopularMovies/k_zv8c981k") else { return }
                viewModel.fetch(url: url)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
