//
//  TabBar.swift
//  RatingMovie
//
//  Created by Fábio Ribeiro de Lima on 02/04/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            FavoritesMovies()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
    }
}

#Preview {
    MainTabView()
}
