//
//  ContentView.swift
//  ImdbApiParser
//
//  Created by Kostya Tsyvilko on 24.05.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Tab 2")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        //.background(Color(UIColor(named: "BackColor") ?? .systemBackground))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
