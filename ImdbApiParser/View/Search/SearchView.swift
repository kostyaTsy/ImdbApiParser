//
//  SearchView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 1.06.22.
//

import SwiftUI

struct SearchView: View {
    var columns: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 150)), count: 2)
    }
    @State var searchString: String = ""
    let categories = ["Top 250 Movies", "Most Popular Movies", "Coming Soon", "In Theaters"]
    
    @ObservedObject var searchViewModel = ApiCall<MovieSearchModel>()
    
    var body: some View {
        NavigationView {
            if searchString == "" {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(categories, id: \.self) { category in
                            NavigationLink(destination: MovieListView(category: category)) {
                                MovieCategoryBoxView(category: category)
                                    .padding(.bottom)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                .navigationTitle("Search")
            }
            // Searching of movies
            else {
                if searchViewModel.dataModel?.results.count ?? 0 > 0 {
                    MovieSearchListView(movieSearchResult: searchViewModel.dataModel?.results ?? [])
                }
                else {
                    ProgressView()
                        .alert(searchViewModel.errorMessage ?? "", isPresented: $searchViewModel.isError) {
                            Button("OK", role: .cancel) { }
                        }
                }
            }
        }
        .onChange(of: searchString) { value in
            //ProgressView()
            //.onAppear {
            guard let url = URL(string: "https://imdb-api.com/en/API/Search/k_zv8c981k/\(searchString)") else { return }
            searchViewModel.fetch(url: url)
            //}
        }
        .searchable(text: $searchString, placement: .automatic)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}
